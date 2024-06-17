Top Charts App
The Top Charts App is an iOS application built with SwiftUI that displays the most popular books and audiobooks generating buzz from critics, NYT, and more. It provides users with a curated list of top-rated books and allows them to filter the list based on book formats and categories.
Features

Displays a list of top-rated books and audiobooks
Supports filtering the list by book formats (e.g., ebook, audiobook)
Allows filtering the list by categories (not implemented in the provided code)
Provides a clean and intuitive user interface
Utilizes asynchronous data loading for improved performance

Screenshots


https://github.com/renup/EverandReading/assets/1608883/0c9232ad-c3a2-4cb0-b126-8c0533bcd064



Architecture
The Top Charts App follows a simple MVVM (Model-View-ViewModel) architecture pattern. The main components of the app are:

TopChartsListView: The main view that displays the list of top-rated books and provides filtering options.
TopChartsViewModel: The view model responsible for managing the state of the app, fetching data from the repository, and handling user interactions.
TopChartsRepository: The repository layer that handles the fetching of top charts data from a remote data source.
Book: The model representing a book or audiobook.

Dependencies
The Top Charts App has the following dependencies:

SwiftUI: The app is built entirely using SwiftUI, Apple's modern framework for building user interfaces.
Combine: The app uses Combine framework for handling asynchronous operations and data binding.

Installation
To run the Top Charts App on your local machine, follow these steps:

Clone the repository:
Copygit clone https://github.com/your-username/top-charts-app.git

Open the project in Xcode:
Copycd top-charts-app
open TopChartsApp.xcodeproj

Build and run the app in Xcode.

Usage
Upon launching the Top Charts App, you will see a list of top-rated books and audiobooks. You can interact with the app in the following ways:

Scroll through the list to view more books.
Tap on the "Formats" or "Categories" facets to filter the list based on your preferences.
In the filter sheet, select the desired book formats or categories and tap "Apply" to update the list.
Tap on the bookmark button next to a book to save it for later (functionality not implemented in the provided code).

Contributing
Contributions to the Top Charts App are welcome! If you find any bugs, have suggestions for improvements, or want to add new features, please open an issue or submit a pull request.
License
The Top Charts App is released under the MIT License.
Contact
For any questions or inquiries, please contact Renu Punjabi at rpunjabi12@gmail.com.
