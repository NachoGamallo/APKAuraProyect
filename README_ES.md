# 🧠 AURA – Frontend App Móvil (iOS & Android)

Este repositorio contiene la **Aplicación Móvil Cliente** de **AURA**, desarrollada en Flutter. Es la interfaz gráfica con la que interactúa el usuario final.Está diseñada siguiendo principios de UX/UI modernos, con un tema oscuro (Dark Mode) inmersivo.

## 🏗️ Estructura y Flujo de la Aplicación

El frontend no posee lógica de negocio compleja (como cálculos de calorías), sino que **actúa como un presentador de estado** que se comunica constantemente con el Backend.

### 1. Gestión de Estado Global (`FFAppState`)
Toda la memoria de la aplicación en tiempo de ejecución se gestiona a través de la clase `FFAppState` (implementada con el patrón `Provider/ChangeNotifier`).
* **Persistencia:** Utiliza `SharedPreferences` para guardar datos clave (como el perfil del usuario autenticado) en la memoria local del teléfono para que no se pierdan al cerrar la app.
* **Variables Globales:** Almacena la rutina que se está creando (`creationOfARoutine`), el entrenamiento en curso (`ActualSession`), y listas dinámicas de ejercicios (`AllExercises`).

### 2. Capa de Red y API (`api_calls.dart` y `api_manager.dart`)
Toda la comunicación con el Backend se realiza mediante peticiones HTTP:
* **ApiManager:** Una clase base que construye las llamadas (GET, POST, PATCH), inyecta los *Headers* (como `Content-Type` y `Authorization: Bearer <Token>`) y devuelve objetos `ApiCallResponse` con el JSON y código de estado.
* **Esquemas Estructurados (Structs):** Cuando el Backend envía un JSON (ej. datos de un ejercicio), Flutter lo convierte en un "Struct" (ej. `ExerciseDetailsStruct`), que es un objeto Dart tipado para trabajar de manera segura en la UI sin lidiar con Mapas JSON crudos.

### 3. Flujo Principal del Usuario (Pantallas y Componentes)
La navegación se maneja mediante `go_router` (navegación declarativa).
* **Onboarding (`/log_in_register`):** Pantallas para Login y Registro. El registro recopila métricas físicas mediante deslizadores (sliders) y selectores (dropdowns) que rellenan el `CreationUserStruct` antes de enviar el POST al backend.
* **Home (`/principals_screens`):** Consume un endpoint masivo (`/api/user/home`) para pintar el Dashboard (gráficas, rutinas completadas, calorías meta).
* **Creador de Rutinas (`/create_routine`):** Permite ensamblar una lista dinámica de ejercicios. [cite_start]Utiliza componentes reutilizables como `ExerciceCardWidget` donde el usuario configura series, kilos y cronómetros por ejercicio.
* **Ejecución (Workout):** El motor principal. Al iniciar una rutina, la app levanta la pantalla `ExecuteRoutineWidget`. [cite_start]Activa un cronómetro global (`stop_watch_timer`) y permite marcar casillas (`RowSerieWidget`) actualizando el peso real levantado antes de enviar la sesión finalizada al backend.

---

## ⚙️ Guía de Ejecución y Conexión NGROK

Para que esta aplicación móvil funcione correctamente, **debe enlazarse a la URL de NGROK generada por el Backend**.

### 1. Requisitos Previos
* Instalar [Flutter SDK](https://docs.flutter.dev/get-started/install) versión `>=3.0.0`.
* Android Studio (con emulador Android) o Xcode (para simuladores iOS).

### 2. 🔗 Conectar el Frontend al Backend (MUY IMPORTANTE)
El frontend trae quemadas URLs de desarrollo. Para que hable con TU servidor local:
1.  Abre tu terminal donde NGROK está corriendo y copia la URL (ej. `https://xyz-123.ngrok-free.dev`).
2.  Abre el proyecto Flutter en tu editor y dirígete al archivo:
    `lib/backend/api_requests/api_calls.dart`
3.  Utiliza la herramienta de "Buscar y Reemplazar" de tu editor. Busca la cadena:
    `https://impose-glamour-that.ngrok-free.dev` (o la URL que esté en el código por defecto).
4.  Reemplázala en todo el archivo por **TU NUEVA URL DE NGROK**.
5.  *Nota Técnica:* Para evitar bloqueos CORS o advertencias del navegador de NGROK, todas las llamadas incluyen en los headers: `'ngrok-skip-browser-warning': 'true'`.

### 3. Instalar Dependencias
Abre una terminal en la raíz del proyecto Flutter y descarga los paquetes listados en el `pubspec.yaml`:
```bash
flutter pub get
