
# evyan_todo_app
### Table of contents
- [System requirements](#system-requirements)
- [Check the UI of the entire app](#app-navigations)
- [Application structure](#project-structure)
- [Libraries and tools used](#libraries-and-tools-used)

### System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Check the UI of the entire app

Check the UI of all the app screens from a single place by setting up the 'initialRoute'  to AppNavigation in the AppRoutes.dart file.

- [Splash screen]
   The opening screen establishes an atmosphere for the program and greets users with a visually engaging interface.

- [Login and Signup Screen]
   Users can securely log in to their existing accounts or create new accounts to have access to customized features and data.

- [Home Page]
   The app's centre hub provides an instant summary of tasks, priorities, and upcoming activities.

- [Profile Page/Personality Screen]
   Users can personalize their profiles and gain insight into their task management personalities.

- [Setting Screen]
   A comprehensive settings page includes the Language Changing Page.
    - Profile edits
    - Terms and Conditions

- [Add TODO Task Screen] - Calendar View: Visual representation of upcoming events.
 The Task Management Screen categorizes tasks as 
  - All
  - In Progress
  - On Hold 
  - Completed.


### Application structure

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains all constants classes
    │   ├── errors                  - It contains error handling classes                  
    │   ├── network                 - It contains network-related classes
    │   └── utils                   - It contains common files and utilities of the application
    ├── data
    │   ├── apiClient               - It contains API calling methods 
    │   ├── models                  - It contains request/response models 
    │   └── repository              - Network repository
    ├── localization                - It contains localization classes
    ├── presentation                - It contains widgets of the screens with their controllers and the models of the whole application.
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```

### Libraries and tools used

- get - State management
  https://pub.dev/packages/get
- connectivity_plus - For status of network connectivity
  https://pub.dev/packages/connectivity_plus
- shared_preferences - Provide persistent storage for simple data
  https://pub.dev/packages/shared_preferences
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image

