import speech_recognition as sr




# transcribe audio file

AUDIO_FILE = "./response1/251be59e5f7b34e85810fbb6ae51ef88.wav"

# use the audio file as the audio source
r = sr.Recognizer()
with sr.AudioFile(AUDIO_FILE) as source:
        audio = r.record(source)  # read the entire audio file



print("Transcription: " + r.recognize_google(audio))
