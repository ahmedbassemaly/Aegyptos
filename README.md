# Aegyptos - Hieroglyphs Translation Mobile App

Aegyptos is a mobile application that allows users to translate hieroglyphic symbols into English text. The app utilizes image recognition and classification techniques to analyze hieroglyphic symbols and provide their corresponding translations based on the Gardiner code system.

## Features

- Image Upload: Users can upload an image containing hieroglyphic symbols from their device's gallery.
- Camera Capture: Users can capture an image of hieroglyphic symbols using their device's camera.
- Hieroglyphic Symbol Classification: The app utilizes the SqueezeNet classifier to classify hieroglyphic symbols based on the Gardiner code system.
- Translation: The app translates the classified hieroglyphic symbols into English text using a Python dictionary.
- Searching: You can search for a word in English and get translated to its corresponding Hieroglyphic characters.
- Profile: Users can have their own profile to edit their own settings and save previously translated images.

## Technologies Used

- Flutter: The app is built using the Flutter framework, enabling cross-platform development for iOS and Android.
- SqueezeNet Classifier: A pre-trained deep learning model used for hieroglyphic symbol classification.
- Python Dictionary: A dictionary implemented in Python to map Gardiner codes to their corresponding English translations.


## Credits

- Flutter: [Flutter](https://flutter.dev)
- SqueezeNet Classifier: [SqueezeNet](https://arxiv.org/abs/1602.07360)
- Python Dictionary: [Python](https://www.python.org/)

