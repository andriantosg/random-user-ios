# Random User

A random user list iOS application.

|         | Main Features  |
----------|-----------------
&#127968; | Clean Architecture that conforms to the Single Responsibility Principle (VIPER)
&#128273; | Use dependency injection & protocol-oriented programming
&#9989;   | Fully unit tested
&#128038; | Written in Swift


## Getting Started

```bash
$ git clone https://github.com/andriantosg/random-user-ios.git
$ cd random-user-ios/
$ pod install
$ open RandomUser.xcworkspace
```

## Behaviour

- Reads a JSON feed from the Internet (https://randomuser.me)
- Parses it and shows the contents in a list
- Clicking on a list item shows a detailed view of that item
- Persists the contents of the feed locally, so if the app is used without Internet
connection it will show previously downloaded content

## Third Party Software

- Alamofire
- Kingfisher

## Requirements

- Xcode 12.0+
- iOS 14.0+
