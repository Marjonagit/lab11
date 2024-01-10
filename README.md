# Firebase Authentication App

This is a simple mobile app that demonstrates user authentication using Firebase. The app consists of three screens: Login, Registration, and the Main Page. It allows users to sign in, register, and displays a welcome screen on the Main Page.

## Screens

### 1. Login Screen
- Icon on the top
- 2 text fields for username and password
- 2 buttons for sign in and sign up
  - On sign in, the app goes directly to the Main Page and reads data from Firebase
  - On sign up, the app navigates to the Registration screen

### 2. Registration Screen
- 3 text fields for username, password, and full name
- 1 button to store user information and save them in Firebase

### 3. Main Page
- Custom design for a welcome screen
- Displays the user email retrieved from Firebase

## Firebase Integration

The app integrates with Firebase for user authentication and data storage. Firebase is used to securely store user credentials and retrieve user data when signing in.

## How to Run the App

1. Clone the repository to your local machine.
   ```bash
   git clone https://github.com/your-username/firebase-authentication-app.git
