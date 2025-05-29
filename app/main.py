from fastapi import FastAPI
from pydantic import BaseModel
from app.xtts_generate import generate_tts

app = FastAPI()

class TTSRequest(BaseModel):
    text: str
    speaker: str = "default"

@app.post("/api/tts")
def tts(req: TTSRequest):
    output_file = generate_tts(req.text, req.speaker)
    return {"status": "success", "file": output_file}
