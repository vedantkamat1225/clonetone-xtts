#!/bin/bash

# Navigate to workspace
cd /workspace

# Clone only if it doesn't exist
if [ ! -d "clonetone-xtts" ]; then
  git clone https://github.com/vedantkamat1225/clonetone-xtts.git
fi

# Enter the repo
cd clonetone-xtts

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Confirm GPU access
echo "🔥 Checking GPU access..."
python3 -c "import torch; print('CUDA Available:', torch.cuda.is_available())"

# Launch FastAPI (replace with actual entry point if needed)
python3 app/autostart.py
