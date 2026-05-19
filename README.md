# 🧠 AURA App – Mobile Client Specification (Flutter / Dart)

This repository contains the code for the **Mobile Client Application** of **AURA**, developed with **Flutter** (cross-platform architecture for iOS and Android). The application provides an immersive visual interface in Dark Mode, specifically tailored for high-performance sports environments.

---

## 🏗️ 1. State Architecture & Local Data Model

The application is governed by a decoupled development pattern where the user interface (UI) does not process data; instead, it reacts to changes in a **Unified Global State** managed by the `FFAppState` class.

### State Management System (`FFAppState.dart`)

The `FFAppState` class inherits from `ChangeNotifier` and implements the *Provider* pattern. It acts as a reactive database in RAM during app execution.

* **Local Persistence (`SharedPreferences`):** To prevent the user from having to log in every time they open the app, the `shared_preferences` library is used. When initializing the state (`initializePersistedState`), the app reads the phone's physical memory, looks for the `ff_actualUser` key, and, if it exists, automatically deserializes the saved JSON, converting it into an object of type `UserDataStruct`.

* **Local Data Structure (Structs):** Instead of working with dynamic maps (`Map<String, dynamic>`) which prone to type errors in Dart, the `lib/backend/schema/structs/` directory defines strongly-typed local models. 

Classes such as `ActualSessionStruct` (stores the workout in progress with its current sets and repetitions), `CreateRoutineStruct` (stores temporary data while the user designs a routine), or `ExerciseDetailsStruct` (stores the technical information of the exercise being viewed) expose explicit methods like `fromMap()`, `toMap()`, and `serialize()` for secure data conversion.

---

## 🌐 2. Network Infrastructure & Data Transmission/Reception

All network communication is centralized and managed by the suite of classes within `lib/backend/api_requests/`.

### Data Flow in a Network Request:

1. **Component Invocation:** When a screen requests data (e.g., `GetHomeDataCall.call()`), a specialized static method is invoked.

2. **Request Construction in `ApiManager`:** The class responsible for making the request packages the options into an `ApiCallOptions` object. It configures the corresponding HTTP method, attaches the parameters in JSON format within the message body if it is a POST/PATCH/PUT, and dynamically injects the necessary network headers (e.g., `Content-Type: application/json`).

3. **Security Token Injection:** If the user has already authenticated, the `ApiManager` reads the stored token and automatically introduces the standard authorization header `Authorization: Bearer <token>`.

4. **Response Management:** The call is processed by Flutter's HTTP client (`http.Client`). Upon receiving the data stream from the backend, an `ApiCallResponse` object is generated.

5. **De-schematization and UI Integration:** The UI evaluates if the response was successful (`response.succeeded`). Using the `json_path` library, it surgically extracts specific fields from the JSON body (e.g., `getJsonField(response, r'$.token')`) and injects them into the global state (`FFAppState`), which triggers the immediate rebuilding of widgets that depend on that information.

---

## 📱 3. Lifecycle Breakdown & Screen Flow

Navigation is managed centrally using declarative routes with `go_router` in the `lib/flutter_flow/nav/nav.dart` file.

### A. Authentication Screen (`LogginScreenWidget`)

* **Entry Behavior:** It is the initial access point configured at the root (`/`).

* **Capture and Interaction:** Text controllers (`TextEditingController`) capture the user's email and password. When pressing the "Log In" button, an HTTP POST request is executed towards the backend by invoking the `LoginCall` class.

* **Success Handling:** If the backend responds with a successful status code, the JWT token is extracted, `authManager.signIn()` is called to update the app's authentication state, and an automatic secondary call to `GetUserDataCall` is chained to retrieve basic profile data (Name and image) before redirecting to the main Dashboard.

### B. Modular Routine Creation (`CreateRoutineScreenWidget`)

* **Temporary Data Management:** While the user designs their routine on the `/createRoutineScreen` screen, all interactions (writing the title, modifying the description, or configuring the kilograms of a set) update the local `creationOfARoutine` model located in the global state in real time.

* **Relational Injection:** When pressing "+ Add Exercise", the app navigates to the `/exercicesScreen` screen. Upon loading, it consumes the complete exercise catalog from the backend using `GetExerciseSummaryCall` and renders a reactive list. When the user taps an exercise, a callback function (`callBack`) is triggered, inserting that exercise into the current routine's temporary list.

* **Advanced Serialization (`custom_functions.dart`):** When saving the completed routine, the custom analytical function `functionForConverTheRoutinesExercices()` is invoked. This function takes the raw structured data from the Flutter interface, iterates over it, extracts the weight and repetitions configured by the user for the first set, and transforms them into a backend-compatible JSON object structured as follows:

    ```json
    {
      "name": "Routine title",
      "desc": "Routine description",
      "exercises": [
        { "exerciseId": "EXERCISE-UUID", "position": 1, "sets": 4, "reps": 12, "restSeconds": 90, "initialWeight": 60.0 }
      ]
    }
    ```
    
    This formatted payload is sent via a POST method through the `CreateRoutineCall` to be permanently saved in the relational database.

### C. Workout Execution Screen (`ExecuteRoutineWidget`)

* **History Loading:** When selecting a routine to train in `RoutinesScreenWidget`, the app makes a GET request to `GetRoutineByIdCall`. The backend returns the preconfigured sets along with the history of the weight lifted in the last completed session.

* **Reactive Sets UI:** Exercises are dynamically listed using the modular `ExerciseCardRoutineWidget` component. Each set is represented by an independent row governed by `RowSerieWidget`.

* **Interactive Timer Management:** When the user physically completes an exercise set, they press the component's check button (`Icons.check_circle_outline_outlined`). The component reacts by instantly changing its background color to green (`Color(0xFF58984E)`) to provide visual feedback and automatically activates a countdown timer (`FlutterFlowTimerController`) configured exactly with the rest seconds assigned to that specific exercise. Once the timer ends, the user knows they should start the next set.

* **Session Closure:** Upon finishing the session, the global duration stopwatch (`StopWatchMode.countUp`) is stopped, all sets completed by the user are processed through the static conversion function `jsonFormatToSessionExercises()`, and a massive POST is made to `saveSessionDataCall` to store the sports performance information permanently on the server.

---

## 🛠️ 4. Connection & Full Deployment Guide with NGROK

To deploy the mobile application and interconnect it with the Backend repository exposed to the internet, follow these steps carefully:

1. **Obtain the Active Backend URL:** Make sure you have the Backend running on your local machine and exposed via NGROK as detailed in its respective guide. Copy the generated URL (example: `https://abcd-123-45.ngrok-free.dev`).

2. **Modify API Access Points in Flutter:** Open this frontend repository in your development environment (VS Code or Android Studio). Head to the centralized network call file: `lib/backend/api_requests/api_calls.dart`.

3. **Apply Global Replacement:** Use your editor's bulk replacement key combination (`Ctrl + Shift + H` on Windows/Linux or `Cmd + Shift + H` on macOS). 

    * *Find:* `https://impose-glamour-that.ngrok-free.dev` (which is the default development URL in your code).
    
    * *Replace with:* **Your active public NGROK URL** (e.g., `https://abcd-123-45.ngrok-free.dev`). Run the replacement across all occurrences in the file.
    
    * *Technical Explanation:* By performing this step, all API call classes (`ChangeUserDataGroup`, `RoutinesApiGroup`, `WorkOutGroupGroup`, `LoginCall`, etc.) will seamlessly route their network traffic through NGROK's secure servers directly to port `8080` of your local machine where Spring Boot is listening.

4. **Download Framework Packages:** Open a command console at the root of this frontend project (where the `pubspec.yaml` file resides) and run the download and indexing of Flutter dependencies:

    ```bash
    flutter pub get
    ```

5. **Compile and Launch the Application:** Open a mobile device emulator in your development environment or connect a physical cell phone with USB debugging enabled. Launch the software deployment by running:

    ```bash
    flutter run
    ```
    
    Flutter will compile the Dart source code into native machine code (APK for Android or APP for iOS) and automatically install the AURA platform on the device. The application will start immediately, allowing user registration, login, and real-time operation of the system by communicating directly with your local server's database over the internet.
