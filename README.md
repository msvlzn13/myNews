myNews
<p align="center"> <img src="https://img.shields.io/badge/Swift-5.0-orange?logo=swift" alt="Swift Badge" /> <img src="https://img.shields.io/badge/iOS-16%2B-blue?logo=apple" alt="iOS Badge" /> <img src="https://img.shields.io/badge/Architecture-MVVM-ff69b4" alt="MVVM Badge" /> </p>
myNews is a simple mobile news application developed in Swift using UIKit and following the MVVM architecture.

Project Features
Clean MVVM structure (Model-View-ViewModel)

Networking with URLSession

Asynchronous JSON parsing with error handling

Dynamic UITableView displaying news headlines and descriptions

Safe memory management with [weak self] in closures

Well-organized folder structure:

View: Contains UI elements like NewsViewController and NewsCell

ViewModel: Contains the NewsViewModel

Model: Includes NewsResponse, Source, and NewsArticle models

Network: Includes the NewsService responsible for API calls

Main: App lifecycle files like AppDelegate and SceneDelegate

Assets, LaunchScreen, and Info.plist

Tests: Unit and UI test targets

Built with love using Swift and UIKit.
