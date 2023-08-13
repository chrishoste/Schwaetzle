![Frame 9](https://github.com/chrishoste/Schwaetzle/assets/22995847/b5f4c714-f157-4bbc-b8b7-c461e063707d)

[![xcode](https://img.shields.io/badge/xcode-15_Beta-green)](https://img.shields.io/badge/xcode-15_Beta-Green)
[![iOS](https://img.shields.io/badge/iOS-17_Beta-green)](https://img.shields.io/badge/iOS-17_Beta-Green)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

# Schwaetzle
In Swabian dialect, "Schwätzle" translates to a friendly chat or conversation, while "Stüble" refers to a cozy room. A showcase of my journey in learning Swift UI and SwiftData (iOS 17 & xcode 15). This project demonstrates my skills in building a functional iOS application that interacts with a REST API, displays office room information, and incorporates various features like filtering, data display, and booking functionalities.

In this project, I have developed an iOS app that retrieves office room information from a secure REST endpoint. The app's core functionality revolves around displaying a list of office rooms, allowing users to filter by department and room type, and providing detailed information about different rooms, including booking capabilities for meeting rooms.

## Features
- [x] The app presents a user-friendly list of office rooms, providing key details at a glance.
- [x] Users can conveniently filter the rooms by department and type to easily find what they need.
- [x] For rooms with additional facts, a dedicated page showcases the provided information.
- [x] The app allows users to schedule meetings by booking available meeting rooms for specific time durations.

## Requirements

To run this application, you will need the following:
- Xcode 15-Beta
- iOS 17-Beta
- Internet connection to fetch room data from the API

## Before running the project

To run this project successfully, you'll need to provide a specific URL and basic authentication information in the `app.xcconfig` file. 

1. Open the `Meeting/Configuration/Debug/app.xcconfig` file.

2. Set the `OFFICE_URL`, `BASIC_AUTH_USER`, and `BASIC_AUTH_PW` variables as follows:

   ```plaintext
   OFFICE_URL = <URL>
   BASIC_AUTH_USER = <USER>
   BASIC_AUTH_PW = <PW>
   ```

   Replace `<URL>` with the actual URL you need to connect to, `<USER>` with your basic authentication username, and `<PW>` with your corresponding password.

3. Now, when you build and run the project, the app will use the provided URL and authentication information to communicate with the necessary resources.

For more details on the configuration settings file format and how it works, you can refer to the [Xcode documentation](https://help.apple.com/xcode/#/dev745c5c974).


## Technology Stack

- SwiftUI
- SwiftData / @Query
- Oberservation / @Observable / @Bindable

## Known Issues

Currently, there is an issue with the `CalendarView` / `DatePicker` in the detail view of a meeting room. Despite successful data binding and triggering of a new search for meetings on the selected date, there is an observed problem where the selected date does not get highlighted in the calendar interface. Several attempts to resolve this issue have been made, but unfortunately, without success. At this stage, it's worth noting that the project is in a beta setup, and this particular issue might be related to the environment.

## Screenshots

|Screen |Screen |
|-------|-------|
|![1](https://github.com/chrishoste/Schwaetzle/assets/22995847/1b11dbf6-22a7-48b2-ad3b-29536eaaa667)|![2](https://github.com/chrishoste/Schwaetzle/assets/22995847/1f15b889-72b3-46e7-a91f-a8cea1d88c11)|
|![3](https://github.com/chrishoste/Schwaetzle/assets/22995847/6d28c45f-e0bd-4541-80d3-bf8147ffee43)|![4](https://github.com/chrishoste/Schwaetzle/assets/22995847/0bea5ec8-f85f-4fe6-9558-dd6727432048)|
|![5](https://github.com/chrishoste/Schwaetzle/assets/22995847/ffd92c4f-04e0-4aaa-8006-7b1032dfaeb4)|![6](https://github.com/chrishoste/Schwaetzle/assets/22995847/5cd9a92e-e89e-4e92-90d1-6cfb3f333a0b)|
|![7](https://github.com/chrishoste/Schwaetzle/assets/22995847/757dbfd3-5ea6-451d-9063-9edef27a56b6)|![8](https://github.com/chrishoste/Schwaetzle/assets/22995847/495a571f-b6df-4e55-870b-63bfcc12cbc1)|










