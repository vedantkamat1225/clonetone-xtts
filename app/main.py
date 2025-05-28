from fastapi import FastAPI, Request
from fastapi.responses import FileResponse
from app.xtts_generate import generate_tts

app = FastAPI()

@app.post("/api/tts")
async def generate_voice(data: Request):
    body = await data.json()
    text = body.get("text", "")
    speaker = body.get("speaker", "default")  # speaker embedding name

    output_file = generate_tts(text, speaker)
    return FileResponse(output_file, media_type="audio/mpeg", filename="output.mp3")
