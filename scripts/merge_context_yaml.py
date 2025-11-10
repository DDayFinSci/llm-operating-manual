import hashlib, pathlib, datetime

ROOT = pathlib.Path(__file__).resolve().parents[1]
RAW = ROOT / "context__exports"
OUTDIR = ROOT / "context" / "merged"
OUTDIR.mkdir(parents=True, exist_ok=True)
OUT = OUTDIR / "merged_context.yaml"

SOURCES = ["claude", "chatgpt", "notebooklm"]  # folders under context__exports
TOKEN = "INTEGRATION_CHECK_TOKEN :: 7f3b8a78"

def sha256_bytes(b: bytes) -> str:
    return hashlib.sha256(b).hexdigest()

def main():
    files = []
    seen_hashes = set()
    for src in SOURCES:
        base = RAW / src
        if not base.exists():
            continue
        for p in sorted(base.rglob("*.yaml")):
            data = p.read_bytes()
            h = sha256_bytes(data)
            if h in seen_hashes:
                continue   # skip exact duplicate YAML docs
            seen_hashes.add(h)
            rel = p.relative_to(RAW).as_posix()
            files.append({
                "source": src,
                "rel_path": rel,
                "sha256": h,
                "bytes": len(data),
                "path": p,
                "text": data.decode("utf-8", errors="ignore")
            })

    stamp = datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S UTC")

    # --- Write a multi-document YAML stream ---
    with OUT.open("w", encoding="utf-8", newline="\n") as f:
        # Doc 1: manifest (machine-readable and tiny)
        f.write("---\n")
        f.write("integrated_baseline_manifest:\n")
        f.write(f"  generated_utc: \"{stamp}\"\n")
        f.write(f"  integration_check_token: \"{TOKEN}\"\n")
        f.write("  files:\n")
        for i, meta in enumerate(files, 1):
            f.write("    - index: {}\n".format(i))
            f.write("      source: {}\n".format(meta["source"]))
            f.write("      rel_path: {}\n".format(meta["rel_path"]))
            f.write("      sha256: {}\n".format(meta["sha256"]))
            f.write("      bytes: {}\n".format(meta["bytes"]))
        f.write("...\n")

        # Subsequent docs: the originals, unchanged
        for i, meta in enumerate(files, 1):
            f.write("---\n")
            f.write("# Source: {}\n".format(meta["rel_path"]))
            f.write("# SHA256: {}\n".format(meta["sha256"]))
            f.write(meta["text"].rstrip() + "\n")
            f.write("...\n")

    print(f"Wrote {OUT} with {len(files)} YAML documents (+1 manifest).")

if __name__ == "__main__":
    main()
