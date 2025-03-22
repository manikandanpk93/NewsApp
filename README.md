# News App

The News App is an iOS application built using Swift and UIKit with MVVM architecture. The app fetches top headlines from the US using the NewsAPI. It follows best practices in architecture, testing, and scalability, ensuring a smooth and reliable user experience. The app also integrates a like and comment system from an external API.


## Features

- Fetch and display the latest news headlines from NewsAPI
- View detailed news articles with images
- Fetch Like and comment counts on articles (via an external API)
- Efficient networking using `async/await`
- Image Caching for optimized performance
- Modular architecture for future scalability
- Unit testing for core functionalities


## Tech Stack

Language: Swift

Framework: UIKit

Architecture: MVVM (Model-View-ViewModel)

Networking: URLSession with async/await

Image Loading: SDWebImage (for caching images)


## Installation

Clone the repository:

git clone https://github.com/yourusername/NewsApp.git
cd NewsApp

Open NewsApp.xcworkspace in Xcode.


## API Integration

This app uses the NewsAPI to fetch news articles. Make sure to register and get an API key.

<!-- For this interview purpose, API Key is hardcoded in the app.-->


## Future Enhancements

Implement offline mode with Core Data or Realm

Support for multiple news categories

Dark mode support

Push notifications for breaking news


## License

This project is licensed under the MIT License - see the LICENSE file for details.


## Author

Developed by Manikandan

