# Aegyptos - Hieroglyphs Translation Mobile App

Aegyptos is a mobile application that allows users to translate hieroglyphic symbols into English text. The app utilizes image recognition and classification techniques to analyze hieroglyphic symbols and provide their corresponding translations based on the Gardiner code system.

## Features

- Image Upload: Users can upload an image containing hieroglyphic symbols from their device's gallery.
- Camera Capture: Users can capture an image of hieroglyphic symbols using their device's camera.
- Hieroglyphic Symbol Classification: The app utilizes the SqueezeNet classifier to classify hieroglyphic symbols based on the Gardiner code system.
- Translation: The app translates the classified hieroglyphic symbols into English text using a Python dictionary.

## Technologies Used

- Flutter: The app is built using the Flutter framework, enabling cross-platform development for iOS and Android.
- SqueezeNet Classifier: A pre-trained deep learning model used for hieroglyphic symbol classification.
- Python Dictionary: A dictionary implemented in Python to map Gardiner codes to their corresponding English translations.

## Getting Started

To get started with Aegyptos - Hieroglyphs Translation Mobile App, follow these steps:

1. Clone the repository: `git clone https://github.com/your-username/aegyptos-app.git`
2. Install Flutter: Follow the Flutter installation guide for your operating system: [Flutter Install Guide](https://flutter.dev/docs/get-started/install)
3. Set up your development environment: Configure Flutter and set up an emulator or connect a physical device.
4. Install dependencies: Run `flutter pub get` to fetch the required dependencies.
5. Run the app: Launch the app on your emulator or device using `flutter run`.

## Contributing

Contributions are welcome! If you have any ideas, suggestions, or bug fixes, please open an issue or submit a pull request. Make sure to follow the code style and conventions used in the project.

## License

Aegyptos - Hieroglyphs Translation Mobile App is open source and available under the [MIT License](https://opensource.org/licenses/MIT). Feel free to use, modify, and distribute the app as per the terms of the license.

## Credits

- Flutter: [Flutter](https://flutter.dev)
- SqueezeNet Classifier: [SqueezeNet](https://arxiv.org/abs/1602.07360)
- Python Dictionary: [Python](https://www.python.org/)

