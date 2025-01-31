# COVID-19 Flutter App

A Flutter-based mobile application that provides real-time data and statistics about the COVID-19 pandemic. This app includes global and country-specific information, interactive charts, and animated features for a smooth user experience.

## Features

- **Global COVID-19 Statistics**: View the current worldwide statistics for COVID-19 cases, deaths, and recoveries.
- **Country-specific Data**: Browse COVID-19 data for individual countries.
- **Interactive Pie Chart**: View a pie chart displaying the distribution of cases.
- **Animated Text**: Animated text elements to enhance user interaction.
- **Shimmer Effect**: Smooth loading effects while fetching data.
- **Real-time Data Fetching**: Data is pulled from online sources to keep it up-to-date.

## Project Structure

```
lib/
│
├── models/
│   └── WorldStatesModel.dart          # Contains the data model for world states
│
├── services/
│   └── utils/
│       ├── app_url.dart              # URL constants for API endpoints
│       └── states_services.dart      # Handles API calls and data fetching
│
├── views/
│   ├── countries_list.dart           # Displays the list of countries with COVID data
│   ├── details_screen.dart           # Shows detailed data for a selected country
│   ├── splash_screen.dart            # App launch screen
│   └── world_states.dart            # Displays global COVID-19 statistics
│
├── main.dart                         # Main entry point of the application
└── pubspec.yaml                      # Project dependencies and configurations
```

## Packages Used

- **pie_chart**: A library for displaying interactive pie charts in Flutter.
- **http**: Makes HTTP requests to fetch COVID-19 data from an external API.
- **animated_text_kit**: Provides animated text effects for a dynamic UI.
- **flutter_spinkit**: A collection of loading indicators for Flutter.
- **shimmer**: Adds shimmer loading effects while fetching data.

## Installation

1. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/your-username/covid-19-flutter-app.git
    ```
2. Navigate into the project directory:
    ```bash
    cd covid-19-flutter-app
    ```
3. Install the dependencies:
    ```bash
    flutter pub get
    ```
4. Run the app:
    ```bash
    flutter run
    ```

## Contributing

We welcome contributions to improve the app. To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

