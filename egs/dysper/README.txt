DYSPER: Dysarthric Speech Perception

# PROJECT LAYOUT

/egs/dysper/
        ├── dysper_audio                        # project audio files (source: LibriSpeech, 100 hrs clean)
        │       ├── train                       # training audio
	│	│	├── flac2wav.sh		# converts .flav audio files to .wav audio files
	│	│
        │       ├── test                        # testing audio (approx 5/100 hrs)
        │
        ├── data
        │       ├── train
        │       ├── test
        │       │       ├── spk2gender.txt      # matches speaker ID's with their gender
        │       │       ├── wav.scp             # matches utterance IDs with .wav audio files
        │       │       ├── text.txt            # matches utterance IDs with text transcripts of utterances
        │       │       ├── utt2spk.txt         # matches speaker IDs with .wav audio files
        │       │
        │       ├── local
        │               ├── corpus.txt          # record of every utterance transcription that can occur
        │
        ├── utils                               # ported from WSJ
        ├── steps                               # ported from WSJ
        ├── local
        │       ├── score.sh                    # script to help get decoding results


# Build directory stucture
        $ mkdir dysper_audio dysper_audio/train dysper_audio/test data data/train data/test data/local utils steps local

# SETUP

1. Get LibriSpeech audio data (100 hrs clean)
        $ cd /egs/dysper/dysper_audio/train
        $ wget http://www.openslr.org/resources/12/train-clean-100.tar.gz
        $ tar xvzf train-clean-100.tar.gz
        $ mv LibriSpeech/train-clean-100/* .
        $ mv LibriSpeech/CHAPTERS.TXT .
        $ mv LibriSpeech/BOOKS.TXT .
        $ mv LibriSpeech/LICENSE.TXT .
        $ mv LibriSpeech/README.TXT .
        $ rm -r LibriSpeech/
        $ rm train-clean-100.tar.gz

2. Convert LibriSpeech audio from .flac to .WAV
        $ cd /egs/dysper/dysper_audio/train
        $ chmod +x flac2wav.sh
        $ ./flac2wav.sh
                - May need to add -f flag to rm instruction in flac2wav.sh
