#!/bin/bash

cd /workspace

# Clone the XTTS backend repo if not already there
if [ ! -d "clonetone-xtts" ]; then
  git clone https://github.com/vedantkamat1225/clonetone-xtts.git
fi

cd clonetone-xtts

# Install dependencies
pip install -r requirements.txt

# Launch your backend (adjust path to app/main.py as needed)
python3 app/autostart.py
