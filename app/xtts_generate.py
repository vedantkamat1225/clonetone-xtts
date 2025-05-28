import os
from TTS.api import TTS

# ✅ Set license agreement environment variable before model load
os.environ["COQUI_TOS_AGREED"] = "true"

# Load XTTS model
tts = TTS(model_name="tts_models/multilingual/multi-dataset/xtts_v2").to("cpu")

def generate_tts(text, speaker_id):
    output_path = f"output_{speaker_id}.mp3"
    tts.tts_to_file(
        text=text,
        speaker_wav=f"samples/{speaker_id}.wav",
        language="en",
        file_path=output_path
    )
    return output_path
