import os
from TTS.api import TTS

# Agree to license
os.environ["COQUI_TOS_AGREED"] = "true"

# Load model onto GPU
tts = TTS(model_name="tts_models/multilingual/multi-dataset/xtts_v2").to("cuda")

def generate_tts(text, speaker_id):
    file_path = f"output_{speaker_id}.mp3"
    tts.tts_to_file(
        text=text,
        speaker_wav=f"samples/{speaker_id}.wav",
        language="en",
        file_path=file_path
    )
    return file_path
