# 📺 TV Guide App
This project is a TV Guide Application that allows users to browse TV channels, view program schedules, and set reminders for upcoming shows. The app efficiently handles large XML-based TV guide data and provides a smooth user experience with modern state management techniques.

## 🚀 Key Features
✅ Test-Driven Development (TDD): The project was developed following TDD principles, ensuring a reliable and maintainable codebase with well-defined unit and integration tests.

✅ Efficient XML Parsing: Since the TV guide data comes in large XML files, the app efficiently processes them in chunks, converting the data into Dart models without consuming excessive memory.

✅ State Management with Riverpod: Riverpod was used as the state management solution to handle app-wide state efficiently and ensure optimal performance.

✅ Reminders & Notifications: Users can set reminders for their favorite programs, and the app will send notifications to alert them before the show starts.

✅ Clean Architecture: The app is structured using a Clean Architecture approach, separating concerns into Data, Domain, and Presentation layers, ensuring scalability and maintainability.

## 🛠 Features Implemented During Development
TV Channels & Program Listings: Displayed in a structured format with a horizontal list for channels and a vertical list for programs.
Efficient Data Fetching & Caching: Integrated both remote and local data sources to provide a seamless experience even when offline.
Custom XML Parser: Built a parser to extract relevant TV program details from the XML source while keeping memory usage minimal.
Reminder & Notification System: Implemented a feature allowing users to receive notifications before their favorite programs start.
Unit Testing: Ensured code quality and reliability by writing tests for key components, including data fetching, parsing, and state management logic.
This project showcases a well-structured Flutter app with robust data handling, efficient state management, and a user-friendly feature set. 🚀

# Flutter version  3.24.3 • channel stable, Dart Dart 3.5.3