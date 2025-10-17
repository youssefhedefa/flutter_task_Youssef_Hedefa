# 🏗️ Flutter Task

A **feature-first Flutter application** built with MVVM pattern, Cubit state management, dependency injection, localization, and local persistence.  
Designed to be scalable, modular, and developer-friendly.

---

## 🚀 Project Overview

**Flutter Task** is a modular mobile app built using Flutter and Dart, focusing on clean code architecture and reusability.  
It integrates **state management (Cubit/BLoC)**, **dependency injection (GetIt)**, **local database (sqflite)**, and **localization (EasyLocalization)** to deliver a robust and maintainable structure.

This project serves as a solid foundation for building production-ready Flutter apps with clean separation of concerns between core, features, and presentation layers.

---

## 🧰 Tech Stack

| Category | Technology |
|-----------|-------------|
| **Framework** | Flutter (Dart) |
| **State Management** | `flutter_bloc` (Cubit) |
| **Dependency Injection** | `get_it` |
| **Local Database** | `sqflite` |
| **Localization** | `easy_localization` |
| **Error Handling** | `dartz` (Either) |
| **UI Utilities** | `flutter_screenutil`, `flutter_svg`, `cached_network_image`, `skeletonizer` |
| **Design Assets** | Tajawal Font, SVG & PNG Assets |

---

## 🧱 Architecture

The app follows a **Feature-First + MVVM pattern** approach.  
Each feature (e.g., `home`, `add_ad`) is isolated within its own module and contains:
- **Presentation Layer:** UI + Cubits for state management  
- **Domain Layer:** Business logic & entities  
- **Data Layer:** Repositories, data sources, and local DB operations

### 🗂️ Core Highlights
- **Dependency Injection:** Managed via `get_it` inside `core/di/injection_container.dart`
- **Service Initialization:** Handled by `InitServices()` in `lib/app/init_services.dart`
- **Localization Setup:** Configured in `main.dart` with `EasyLocalization`
- **Database Handling:** Uses `sqflite` with structured helpers for CRUD operations

---

## ✨ Features

- 🏠 **Home Screen:** Displays offers, filters, and categorized products  
- 🛍️ **Add Ad Flow:** Add and manage ads with package selection  
- 🌐 **Localization:** Arabic & English support using `EasyLocalization`  
- 💾 **Local Database:** Offline storage with `sqflite`  
- ⚙️ **Dependency Injection:** Clean and modular DI setup with `GetIt`  
- 🎨 **Custom UI Components:** Responsive layout using `ScreenUtil`  
- 🧩 **Error Handling:** Functional error types with `dartz.Either`

---

## 🗂️ Folder Structure

```
lib/
├─ app/
│  ├─ flutter_task_app.dart
│  └─ init_services.dart
│
├─ core/
│  ├─ constants/
│  ├─ di/                     # Dependency Injection setup (GetIt)
│  ├─ extensions/
│  └─ theme/
│
├─ features/
│  ├─ home/
│  │  └─ presentation/
│  │     ├─ view/
│  │     └─ cubit/
│  │
│  ├─ add_ad/
│  │  └─ presentation/
│  │     ├─ view/
│  │     └─ widgets/
│  │
│  └─ ... other features ...
│
├─ generated/                  # Generated files (e.g., assets.dart)
└─ main.dart
```

---

## ⚙️ How to Run the Project

### 1. Clone the Repository
```bash
git clone https://github.com/<your-username>/flutter_task.git
cd flutter_task
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the App
```bash
flutter run
```

### 4. (Optional) Specify Platform
```bash
flutter run -d android   # For Android
flutter run -d ios       # For iOS
flutter run -d web       # For Web (if enabled)
```

---

## 🌍 Localization

- Supported Languages: **English**, **Arabic**  
- Translation files:  
  ```
  assets/translations/en.json
  assets/translations/ar.json
  ```

Set up via:
```dart
EasyLocalization(
  supportedLocales: [Locale('en'), Locale('ar')],
  path: 'assets/translations',
  child: MyApp(),
);
```

---

## 🧠 Initialization & Dependency Injection

All app-level services (database, DI setup, etc.) are initialized before `runApp()`:
```dart
Future<void> main() async {
  await InitServices().init();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      child: const FlutterTaskApp(),
    ),
  );
}
```

---

## 🖼️ Screenshots

> Add your screenshots under `assets/images/screenshots/` and reference them here:

| Home Screen | Packages Screen | Filter Screen
|--------------|----------------|----------------|
| ![Home](https://github.com/youssefhedefa/flutter_task_Youssef_Hedefa/blob/master/screenshots/home.jpeg) | ![Packages](https://github.com/youssefhedefa/flutter_task_Youssef_Hedefa/blob/master/screenshots/packages.jpeg) | ![Filter](https://github.com/youssefhedefa/flutter_task_Youssef_Hedefa/blob/master/screenshots/filter.jpeg)

![Demo Video](https://github.com/youssefhedefa/flutter_task_Youssef_Hedefa/blob/master/screenshots/presentation_vid.gif)


---

## 👨‍💻 Contributing

Contributions are welcome!

1. Fork the repository  
2. Create a new branch:  
   ```bash
   git checkout -b feat/your-feature
   ```
3. Commit your changes:  
   ```bash
   git commit -m "Add your feature"
   ```
4. Push to the branch:  
   ```bash
   git push origin feat/your-feature
   ```
5. Open a Pull Request 🎉

---

## 🔗 Social Links

- **Author:** [Youssef Hedefa](https://github.com/youssefhedefa)
- **LinkedIn:** [linkedin.com/in/your-profile](https://www.linkedin.com/in/youssef-hedefa-0a7449204/)
- **Email:** mohamedyoussief56@gmail.com

---

## 🪪 License

This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.

---

### 💡 Notes
- Update screenshots and links before publishing.
- Ensure your `pubspec.yaml` assets match the declared paths.
- For new features, remember to register your Cubits/services inside `injection_container.dart`.

---

> _Crafted with ❤️ using Flutter & Clean Architecture._
