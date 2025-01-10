# login_app

A Flutter application that allows users to log in and view their profile, using a backend API for authentication and user data retrieval.

## Features
- Login using email and password.
- View user profile with username, email, and roles.
- Display user roles in the profile.
- Option to log out and go back to the login screen.

## Screens
- **Login Screen**: Allows users to input email and password to authenticate.
- **Profile Screen**: Displays user details such as email, username, and roles after successful login.

## Getting Started

### Prerequisites
1. **Flutter**: Make sure you have Flutter installed. Follow the instructions from the official Flutter website: [Flutter Installation](https://flutter.dev/docs/get-started/install).
2. **Backend API**: This app communicates with a backend for authentication. The backend should be running and accessible at `http://10.0.2.2:8080/api/auth/signin`.

### Installation

1. Clone the repository:

   ```bash
      git clone https://github.com/your-repository/login_app.git
   ```

2. Navigate to the project directory:

    ```bash
       cd login_app
    ```

3. Install dependencies:

    ```bash
       flutter pub get
    ```
   
### Run the App

You need to run the app on an emulator device to reach the backend in locahost on the host of your machine:

   ```bash
      flutter run
   ```

#### User Credentials

You can use the following credentials for login:

**Admin User:**
- `Email:` admin@example.com
- `Password:` admin123

**Moderator User:**
- `Email:` moderator@example.com
- `Password:` mod123

**Regular User:**
- `Email:` user@example.com
- `Password:` user123

### Demo

**Download Link**: [Download Video](demo_video.mp4)
