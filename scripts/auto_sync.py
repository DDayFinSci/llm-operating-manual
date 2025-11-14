"""
Auto-Sync Watcher for Real-Time Context Updates
Monitors changes and automatically syncs across all platforms
"""

import os
import sys
import time
import subprocess
from pathlib import Path
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
from datetime import datetime

class ContextSyncHandler(FileSystemEventHandler):
    def __init__(self):
        self.base_path = Path(r"C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual")
        self.last_sync = 0
        self.sync_cooldown = 5  # seconds
        
    def on_modified(self, event):
        if event.is_directory:
            return
            
        # Check if modification is in a relevant directory
        relevant_paths = [
            "context/merged",
            "context/raw", 
            "context__exports",
            "templates"
        ]
        
        if any(path in event.src_path for path in relevant_paths):
            current_time = time.time()
            if current_time - self.last_sync > self.sync_cooldown:
                self.trigger_sync(event.src_path)
                self.last_sync = current_time
    
    def trigger_sync(self, changed_file):
        print(f"\n[{datetime.now().strftime('%H:%M:%S')}] Change detected: {Path(changed_file).name}")
        print("Triggering unified export...")
        
        try:
            # Run the unified export script
            script_path = self.base_path / "scripts" / "unified_export.py"
            result = subprocess.run(
                [sys.executable, str(script_path)],
                capture_output=True,
                text=True,
                cwd=str(self.base_path)
            )
            
            if result.returncode == 0:
                print("✓ Sync successful")
                self.git_auto_commit(changed_file)
            else:
                print(f"✗ Sync failed: {result.stderr}")
                
        except Exception as e:
            print(f"✗ Error during sync: {str(e)}")
    
    def git_auto_commit(self, changed_file):
        """Auto-commit changes to git."""
        try:
            os.chdir(self.base_path)
            
            # Stage changes
            subprocess.run(["git", "add", "."], check=True)
            
            # Create commit message
            file_name = Path(changed_file).name
            commit_msg = f"Auto-sync: {file_name} updated"
            
            # Commit
            subprocess.run(["git", "commit", "-m", commit_msg], check=True)
            
            # Push to remote
            subprocess.run(["git", "push"], check=True)
            
            print("✓ Changes pushed to GitHub")
            
        except subprocess.CalledProcessError:
            print("ℹ No changes to commit or push failed")
        except Exception as e:
            print(f"✗ Git operation failed: {str(e)}")

def main():
    path_to_watch = r"C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"
    
    event_handler = ContextSyncHandler()
    observer = Observer()
    observer.schedule(event_handler, path_to_watch, recursive=True)
    
    print(f"Context Auto-Sync Monitor Started")
    print(f"Watching: {path_to_watch}")
    print(f"Platforms: Claude, ChatGPT, Perplexity, Arc, Comet")
    print(f"Press Ctrl+C to stop\n")
    
    observer.start()
    
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
        print("\nAuto-sync stopped")
    
    observer.join()

if __name__ == "__main__":
    # Check for required packages
    try:
        import watchdog
    except ImportError:
        print("Installing required packages...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", "watchdog"])
        print("Please restart the script")
        sys.exit(0)
    
    main()
