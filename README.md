# Face Detection Android App

This app uses **Google ML Kit Face Detection** to detect faces in images or through the camera in real-time. The app also manages device permissions such as camera, storage, and internet access.

---

## 📋 Features
- **Face Detection**: Detects facial features such as eyes, nose, mouth, and pose.
- **Compatibility**: Supports images from storage or camera capture.
- **Real-time Processing**: Real-time face detection through the camera.

---

## 🛠️ Setup and Installation

### 1. Add Permissions in AndroidManifest.xml
Ensure the app has the following permissions:

```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.INTERNET"/>
```

### 2. Add Dependency
Add the **ML Kit Face Detection** dependency in the `build.gradle` file at the app level:

```gradle
dependencies {
    implementation 'com.google.mlkit:face-detection:16.1.7'
}
```

---

## 🚀 How to Use
1. Clone this repository to your Android Studio project.
2. Ensure all permissions are set in the `AndroidManifest.xml` file.
3. Add face detection code using the ML Kit API in the main application file.
4. Run the app on a device or emulator with a supported camera.

---

## 📝 Additional Documentation
For more information about the ML Kit Face Detection API, visit the [official ML Kit documentation](https://developers.google.com/ml-kit/vision/face-detection).

---

## 🛡️ Required Permissions
- **Camera**: To capture images directly.
- **Storage**: To save and read image files.
- **Internet**: (Optional) If there is a need for online connectivity.

---

## 🔧 Contribution
If you would like to contribute, please fork this repository and submit a pull request. All contributions are greatly appreciated!

---
# 🧠 Flutter Liveness Detection App with Login and CSV Storage

This project is a **KYC (Know Your Customer) simulation system** built with Flutter. It allows users to log in with their email and password and perform a **liveness detection check** using a device’s camera. It verifies the user through actions like **smile**, **blink**, and **head movement**, displays the result as "LIVE PERSON", and stores login credentials in a **CSV file** on the user's **local machine (Downloads folder)**.

---

## 📌 Project Highlights

- 🏠 **Home Screen** with branding and navigation buttons.
- 🔐 **Login Page** with local data saving.
- 📷 **Liveness Detection** using ML Kit and device camera.
- ✔ **Automatic Action Verification** (smile, blink, head move).
- 📁 **CSV File Creation** for saving login info.
- 💾 **Local Storage** in the user's Downloads directory.
- 🛡️ **Future Scope**: Data encryption, database integration.

---

## 🧑‍💻 Technologies Used

| Technology             | Usage                                                            |
|------------------------|------------------------------------------------------------------|
| **Flutter**            | UI framework for cross-platform apps                             |
| **Dart**               | Programming language used by Flutter                             |
| **Camera**             | Captures live video stream for face detection                    |
| **google_mlkit_face_detection** | Detects smile, blink, and head movement using ML         |
| **permission_handler** | Handles runtime permissions for camera and storage               |
| **path_provider**      | Finds paths like Downloads directory for file storage            |
| **csv**                | Allows writing of structured login data into CSV format          |

---

## 🧭 Application Workflow

### 1. Home Screen
- Displays logo and two buttons: `LOGIN` and `SIGNUP`.
- Clicking `LOGIN` goes to the login screen.

### 2. Login Screen
- User enters **Email** and **Password**.
- Upon clicking `GO`, the credentials are saved in a `.csv` file in the **Downloads** folder.
- Then navigates to the **Liveness Detection Screen**.

### 3. Liveness Detection
- The camera opens and runs detection for **15 seconds**.
- Always displays ✔ marks for:
    - Smile
    - Eye Blink
    - Head Movement
- At the end, displays the result: **LIVE PERSON**.

### 4. Result Screen
- Shows a table with tick marks for detected actions.
- Shows final confirmation below as `"LIVE PERSON"`.

---

## 🧪 How to Run This Project (Windows)

### 🛠️ System Requirements

- Flutter installed on your PC. If not:
  👉 [Flutter Installation Guide](https://docs.flutter.dev/get-started/install/windows)
- A working Android emulator or physical device connected.
- Visual Studio Code / Android Studio (Recommended for development).
- Chrome (if testing in Web mode).

---

### 🧾 Step-by-Step Instructions

#### ✅ Step 1: Clone the Project
```bash
git clone https://github.com/yourusername/flutter-liveness-auth.git
cd flutter-liveness-auth


