#!/bin/bash

echo "✅ Starting CloneTone XTTS backend..."

# Ensure we are in the repo directory
cd /workspace/clonetone-xtts || exit 1

# Install Python dependencies
pip install -r requirements.txt

# Start FastAPI or Gradio app
# If you're using FastAPI:
uvicorn app.api:app --host 0.0.0.0 --port 7860

# Or if you're using Gradio interface:
# python3 app/autostart.py --share
