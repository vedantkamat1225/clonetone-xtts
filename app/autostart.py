# app/autostart.py
import uvicorn
import threading
import time
from app.main import app

last_request_time = time.time()

def update_last_request_time():
    global last_request_time
    last_request_time = time.time()

def shutdown_if_idle():
    while True:
        time.sleep(60)
        if time.time() - last_request_time > 600:
            print("💤 No activity for 10 minutes. Shutting down...")
            exit(0)

if __name__ == "__main__":
    threading.Thread(target=shutdown_if_idle, daemon=True).start()
    uvicorn.run(app, host="0.0.0.0", port=7860)
