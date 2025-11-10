import os, sys, glob, hashlib, datetime, yaml, re
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
EXPORTS_DIR = REPO_ROOT / "context__exports"  # <-- matches your real folder
MERGED_DIR = REPO_ROOT / "context" / "merged"
MERGED_DIR.mkdir(parents=True, exist_ok=True)
MERGED_PATH = MERGED_DIR / "merged_context.yaml"

def slurp_yaml(path: Path):
    with path.open("r", encoding="utf-8") as f:
        return list(yaml.safe_load_all(f))

def file_fingerprint(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(65536), b""):
            h.update(chunk)
    return h.hexdigest()[:12]

def main():
    # pick up ONLY .yaml files in context__exports (not the merged file)
    candidates = sorted(EXPORTS_DIR.glob("*.yaml"))
    docs = []
    files_meta = []
    for p in candidates:
        # extra guard: never read our merged output if someone placed it here
        if p.name == MERGED_PATH.name:
            continue
        try:
            loaded = slurp_yaml(p)
            if not loaded:
                # If a baseline is a single YAML doc, yaml.safe_load_all returns [None] if empty
                loaded = []
            docs.extend(loaded)
            files_meta.append({
                "filename": p.name,
                "relpath": str(p.relative_to(REPO_ROOT)),
                "size_bytes": p.stat().st_size,
                "sha256_12": file_fingerprint(p),
                "doc_count": len(loaded),
            })
        except Exception as e:
            files_meta.append({
                "filename": p.name,
                "relpath": str(p.relative_to(REPO_ROOT)),
                "error": str(e),
            })

    manifest = {
        "integrated_baseline_manifest": {
            "generated_utc": datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S UTC"),
            "integration_check_token": "INTEGRATION_CHECK_TOKEN :: 7f3b8a78",
            "files": files_meta,
            "total_input_docs": sum(f.get("doc_count", 0) for f in files_meta),
        }
    }

    with MERGED_PATH.open("w", encoding="utf-8", newline="\n") as f:
        yaml.safe_dump(manifest, f, sort_keys=False)
        for d in docs:
            f.write("\n---\n")
            yaml.safe_dump(d, f, sort_keys=False)

    print(f"Wrote {MERGED_PATH} with {len(docs)} YAML documents (+1 manifest).")
    print(f"Merged from {len([m for m in files_meta if 'error' not in m])} files.")
    errs = [m for m in files_meta if 'error' in m]
    if errs:
        print("Errors:", errs, file=sys.stderr)

if __name__ == "__main__":
    main()
