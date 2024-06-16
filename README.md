# TVMaze

TVMaze is a Flutter application that allows users to search for TV shows, view details about individual shows, and mark their favorite shows.

## Getting Started

This project uses Melos to manage the project's packages. Melos is a tool that optimizes the workflow for multi-package Flutter and Dart projects. It allows you to handle tasks such as bootstrapping, analyzing, testing, and publishing packages with ease.

To get started with this project, you need to install Melos. You can do this by running:

```sh
dart pub global activate melos
melos bootstrap or melos bs
```

This project uses flutter_gen for localization. To generate localization files, navigate to the tvmaze_core package and run:

```sh
flutter gen-l10n
```

This project also uses json_serializable to generate JSON serialization code. To generate the JSON serialization code, run:

```sh
dart run build_runner build
```

If you are using Visual Studio Code, the project is already configured to run just by pressing `F5`. The `.vscode` settings are already pointing to the correct `main` file.

If you are using Android Studio, you will need to manually set the run configuration to point to `tvmaze/lib/main.dart`.

## Architecture

This project follows a clean architecture approach, which separates the application into three layers: Presentation, Domain, and Data.

- **Presentation Layer:** This is where the UI of the application is handled. It includes widgets for displaying the TV shows and details. It also handles user inputs and interactions.

- **Domain Layer:** This layer contains the business logic of the application. It defines use cases which represent all the possible actions a user can perform in the application.

- **Data Layer:** This layer handles data retrieval and storage. It includes a local data source (Hive database) for storing favorite shows, and a remote data source for fetching TV shows from the TVMaze API.

The project uses the Bloc library for state management. Each feature in the application has its own Bloc which manages its state.

The project also uses other packages such as Dio for networking, Hive for local storage, and json_serializable for JSON serialization.

## Micro Packages

The project is divided into multiple micro packages. This modular approach has several advantages:

- **Separation of Concerns:** Each package has a specific responsibility, making the codebase easier to understand and maintain.
- **Reusability:** Packages can be reused across different parts of the application or even in different projects.
- **Scalability:** It's easier to add new features or modify existing ones without affecting other parts of the application.
- **Testability:** Smaller, focused packages are easier to test.

Here's a brief overview of the packages in this project:

- **`tvmaze_core`**: This package contains shared utilities and widgets used throughout the application. It also includes global settings and themes.
- **`tvmaze_home`**: This package is responsible for the application's home screen. It includes the logic for displaying featured shows and managing show search.
- **`tvmaze_shows`**: This package handles the display of details for a specific show. It includes the logic to retrieve and display show details, as well as add/remove shows from favorites.
- **`tvmaze_people`**: This package is responsible for the people search and display functionality. It includes the logic to search for people and display details about a specific person.
- **`tvmaze_seasons`**: This package handles the display of seasons for a specific show. It includes the logic to retrieve and display a show's seasons.
- **`tvmaze_episodes`**: This package is responsible for displaying the episodes of a specific season. It includes the logic to retrieve and display a season's episodes.
- **`tvmaze`**: This is the main package that brings all the other packages together and builds the final application.

