#!/bin/bash

echo "🔁 Pulling code..."
if [ ! -d "/workspace/clonetone-xtts" ]; then
  cd /workspace && git clone https://github.com/vedantkamat1225/clonetone-xtts.git
else
  cd /workspace/clonetone-xtts && git pull
fi

cd /workspace/clonetone-xtts

echo "📦 Installing requirements..."
pip install -r requirements.txt

echo "🚀 Starting XTTS..."
python3 app/autostart.py

# After XTTS start
echo "🕒 Monitoring for idle..."
while true; do
  IDLE=$(netstat -an | grep :7860 | grep ESTABLISHED | wc -l)
  if [[ "$IDLE" -eq 0 ]]; then
    echo "Idle detected. Waiting 10 minutes..."
    sleep 600
    IDLE=$(netstat -an | grep :7860 | grep ESTABLISHED | wc -l)
    if [[ "$IDLE" -eq 0 ]]; then
      echo "Still idle. Shutting down."
      shutdown now
    fi
  fi
  sleep 60
done
