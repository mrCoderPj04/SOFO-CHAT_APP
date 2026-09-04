# 📱 PJSOFONIC Connect Mobile (SOFO-CHAT_APP)

A cross-platform **Flutter (iOS & Android)** mobile application powering enterprise real-time messaging, WebRTC audio/video meetings, group collaboration, and live EMS directory synchronization.

---

## ✨ Features & Highlights

- **💬 Real-Time WhatsApp-Style Messaging**:
  - Outgoing sent messages aligned to the **right** with distinct blue glow bubbles.
  - Incoming received messages aligned to the **left** with sender details and timestamps.
  - Quick attachments, voice note audio simulation, and live text input.

- **🎥 WebRTC Video & Audio Conferencing**:
  - High-performance peer-to-peer audio and video calling via `flutter_webrtc`.
  - Zoom/Meet style meeting code joiner (`pj-xxx-xxx`).
  - Real-time camera toggle, microphone mute/unmute, and active speaker layout.

- **👥 Live EMS Directory & Profile Integration**:
  - Browse enterprise colleagues synced with the live EMS ERP backend.
  - View employee details: Department, Designation, Email, and Employee ID.
  - Direct 1-on-1 chat and audio/video calling shortcuts.

- **📊 Dashboard & AI Agent Hub**:
  - Real-time overview of active chats, upcoming meetings, and system notifications.
  - Dedicated AI agent assistant screen for workplace automation.

- **🎨 Modern Liquid-Glass Dark Theme**:
  - Cyberpunk-inspired dark aesthetic (`#090D16`, `#0F172A`, `#00F0FF` Cyan, `#0284C7` Blue).
  - Clean typography using Google Fonts (**Plus Jakarta Sans**).
  - Smooth 60 FPS transitions and tactile interactions.

---

## 🛠️ Tech Stack & Dependencies

| Package | Purpose |
| :--- | :--- |
| **Flutter 3.x / Dart >=3.2** | Cross-platform UI toolkit and language |
| **`flutter_webrtc`** | WebRTC plugin for real-time video/audio calling |
| **`provider`** | Reactive state management |
| **`http`** | REST API communication with backend |
| **`stomp_dart_client` / WebSockets** | Real-time messaging and signaling |
| **`shared_preferences`** | Local token & user profile caching |
| **`google_fonts`** | Plus Jakarta Sans typography |
| **`cached_network_image`** | Smooth image and avatar loading with caching |
| **`intl` & `uuid`** | Date/time formatting and unique identifier generation |

---

## 📁 Directory Structure

```text
mobile/
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   │   └── app_theme.dart         # Dark theme tokens, colors, and typography
│   │   └── models/
│   │       └── models.dart            # Data models (User, Message, Meeting, Department)
│   ├── features/
│   │   ├── auth/
│   │   │   └── login_screen.dart      # EMS Authentication screen
│   │   ├── chat/
│   │   │   ├── chat_screen.dart       # Active conversations list & EMS directory
│   │   │   └── chat_detail_screen.dart# 1-on-1 chat room with Right/Left message layout
│   │   ├── meetings/
│   │   │   ├── meetings_screen.dart   # Meeting dashboard & code joiner
│   │   │   └── meeting_room_screen.dart # WebRTC Video/Audio grid & controls
│   │   ├── dashboard/
│   │   │   └── dashboard_screen.dart  # Main hub & metric cards
│   │   ├── agents/
│   │   │   └── agents_screen.dart     # AI Assistant interface
│   │   └── profile/
│   │       └── profile_screen.dart    # Employee profile, bio, and settings
│   └── main.dart                      # Flutter app entry point & theme configuration
├── pubspec.yaml                       # Dependencies & asset declarations
└── README.md                          # Mobile documentation
```

---

## 🚀 Getting Started

### Prerequisites
- **Flutter SDK**: `v3.16.0` or higher ([Install Flutter](https://docs.flutter.dev/get-started/install))
- **Dart SDK**: `>=3.2.0 <4.0.0`
- **Android Studio** (for Android SDK) or **Xcode** (for iOS simulator/device)

### 1. Clone the Repository
```bash
git clone https://github.com/mrCoderPj04/SOFO-CHAT_APP.git
cd SOFO-CHAT_APP
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the App
Connect an Android/iOS device or launch an emulator/simulator, then execute:
```bash
# Run on connected device
flutter run

# Run in Release mode for optimal performance
flutter run --release
```

---

## 📦 Building for Production

### Android (APK & App Bundle):
```bash
# Build universal Release APK
flutter build apk --release

# Build Google Play App Bundle (AAB)
flutter build appbundle --release
```
The resulting `.apk` file will be located in `build/app/outputs/flutter-apk/app-release.apk`.

### iOS:
```bash
flutter build ios --release
```

---

## 🌐 Backend & API Integration

The app connects to the **PJSOFONIC Connect Backend**:
- **Production API**: `https://backend-sofochat.onrender.com/api`
- **WebSocket / WebRTC Signaling**: `wss://backend-sofochat.onrender.com/ws`
- **EMS Enterprise Auth**: `https://erp-backend-1-02lc.onrender.com`

---

## 📄 License
Internal Enterprise Proprietary — **PJSOFONIC Connect**. All rights reserved.
