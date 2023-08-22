![logo](https://github.com/chrishoste/Schwaetzle/assets/22995847/30170409-b167-4340-aa9f-7480c1207e99)

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
|![1](https://github.com/chrishoste/Schwaetzle/assets/22995847/408c519e-83e6-443b-8f0a-311838964e17)|![2](https://github.com/chrishoste/Schwaetzle/assets/22995847/eade5553-37ab-4b3c-82c9-32410ac4b004)|
|![3](https://github.com/chrishoste/Schwaetzle/assets/22995847/5f4380fb-028a-4597-ac17-dfd1f3364b36)|![4](https://github.com/chrishoste/Schwaetzle/assets/22995847/93eb4747-1341-411f-bd3b-2d1aa6abc10c)|
|![5](https://github.com/chrishoste/Schwaetzle/assets/22995847/8084f6b1-0dab-4a2c-8af2-f58152a70f53)|![6](https://github.com/chrishoste/Schwaetzle/assets/22995847/9bf7c259-a55c-4365-8071-986d68eda088)|
|![7](https://github.com/chrishoste/Schwaetzle/assets/22995847/ec76511f-fd71-4f92-93a0-c81d2bbe1e43)|![8](https://github.com/chrishoste/Schwaetzle/assets/22995847/31b33ba7-6a62-4825-a7d4-d13a23dec7f4)|
|![9](https://github.com/chrishoste/Schwaetzle/assets/22995847/e9bd68bd-a7bf-47f0-a2e7-c658a402a3d2)|![10](https://github.com/chrishoste/Schwaetzle/assets/22995847/3d3d4430-8292-4638-b551-449d2a69d241)|




















