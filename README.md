# 🧠 AURA App – Especificación del Cliente Móvil (Flutter / Dart)

Este repositorio contiene el código de la **Aplicación Móvil Cliente** de **AURA**, desarrollada con **Flutter** (arquitectura multiplataforma para iOS y Android).La aplicación proporciona una interfaz visual inmersiva en Modo Oscuro (Dark Mode) enfocado a entornos deportivos de alto rendimiento.

---

## 🏗️ 1. Arquitectura de Estado y Modelo de Datos Local

La aplicación se rige bajo un patrón de desarrollo desacoplado donde la interfaz de usuario (UI) no procesa datos, sino que reacciona a los cambios de un **Estado Global Unificado** administrado por la clase `FFAppState`.

### Sistema de Gestión de Estado (`FFAppState.dart`)

La clase `FFAppState` hereda de `ChangeNotifier` e implementa el patrón *Provider*.Actúa como una base de datos reactiva en memoria RAM durante la ejecución de la app.
* **Persistencia Local (`SharedPreferences`):** Para evitar que el usuario deba iniciar sesión cada vez que abre la app, se utiliza la librería `shared_preferences`.Al inicializar el estado (`initializePersistedState`), la app lee la memoria física del teléfono, busca la clave `ff_actualUser` y, si existe, deserializa automáticamente el JSON guardado convirtiéndolo en un objeto de tipo `UserDataStruct`.

* **Estructura de Datos Local (Structs):** En lugar de trabajar con mapas dinámicos (`Map<String, dynamic>`) que propician errores de tipado en Dart, el directorio `lib/backend/schema/structs/` define modelos locales fuertemente tipados. Clases como `ActualSessionStruct` (almacena el entrenamiento en curso con sus series y repeticiones actuales), `CreateRoutineStruct` (almacena los datos temporales mientras el usuario diseña una rutina) o `ExerciseDetailsStruct` (almacena la información técnica del ejercicio que se está consultando) exponen métodos explícitos como `fromMap()`, `toMap()` y `serialize()` para una conversión segura de datos.

---

## 🌐 2. Infraestructura de Red y Envío/Recepción de Datos

Toda la comunicación de red está centralizada y gestionada por la suite de clases dentro de `lib/backend/api_requests/`.

### Flujo de Datos en una Petición de Red:

1.  **Invocación del Componente:** Cuando una pantalla solicita datos (ej: `GetHomeDataCall.call()`), se invoca un método estático especializado.

2.  **Construcción de la petición en `ApiManager`:** La clase encargada de realizar la petición empaqueta las opciones en un objeto `ApiCallOptions`. Configura el método HTTP correspondiente, adjunta los parámetros en formato JSON dentro del cuerpo del mensaje si es un POST/PATCH/PUT , e inyecta de forma dinámica las cabeceras de red necesarias (ej: `Content-Type: application/json`).

3.  **Inyección del Token de Seguridad:** Si el usuario ya se ha autenticado, el `ApiManager` lee el token almacenado e introduce automáticamente la cabecera estándar de autorización `Authorization: Bearer <token>`.

4.  **Gestión de la respuesta:** La llamada es procesada por el cliente HTTP de Flutter (`http.Client`).Al recibir el flujo de datos del backend, se genera un objeto `ApiCallResponse`.

5. **Desesquematización e Integración con la UI:** La UI evalúa si la respuesta fue exitosa (`response.succeeded`).Utilizando la librería `json_path`, extrae de forma quirúrgica campos específicos del cuerpo JSON (ej: `getJsonField(response, r'$.token')`) y los inyecta en el estado global (`FFAppState`), lo que dispara la reconstrucción inmediata de los widgets que dependen de esa información.

---

## 📱 3. Desglose del Ciclo de Vida y Flujo de Pantallas

La navegación es administrada de manera centralizada mediante rutas declarativas con `go_router` en el archivo `lib/flutter_flow/nav/nav.dart`.

### A. Pantalla de Autenticación (`LogginScreenWidget`)

* **Comportamiento de entrada:** Es el punto de acceso inicial configurado en la raíz (`/`). 

* **Captura e interacción:** Los controladores de texto (`TextEditingController`) capturan el correo y contraseña del usuario.Al pulsar el botón "Iniciar Sesión", se ejecuta un POST HTTP hacia el backend invocando la clase `LoginCall`.

* **Tratamiento del Éxito:** Si el backend responde con un código de estado exitoso, se extrae el token JWT , se invoca `authManager.signIn()` para actualizar el estado de autenticación de la app y se encadena una llamada secundaria automática a `GetUserDataCall` para recuperar los datos básicos del perfil (Nombre e imagen) antes de redirigir al Dashboard principal.

### B. Creación de Rutinas Modulares (`CreateRoutineScreenWidget`)

* **Gestión de Datos Temporales:** Mientras el usuario diseña su rutina en la pantalla `/createRoutineScreen` , todas las interacciones (Escribir el título, modificar la descripción o configurar los kilogramos de una serie) actualizan en tiempo real el modelo local `creationOfARoutine` ubicado en el estado global.
* **Inyección Relacional:** Al presionar "+ Agregar Ejercicio", la app viaja a la pantalla `/exercicesScreen`. Al cargar, consume el catálogo completo de ejercicios del backend mediante `GetExerciseSummaryCall` y dibuja un listado reactivo. Cuando el usuario pulsa sobre un ejercicio, se dispara una función de retorno (`callBack`) que inserta dicho ejercicio en la lista temporal de la rutina actual.
* **Serialización Avanzada (`custom_functions.dart`):** Al guardar la rutina finalizada, se invoca la función analítica personalizada `functionForConverTheRoutinesExercices()`. Esta función toma los datos crudos estructurados de la interfaz de Flutter, itera sobre ellos, extrae el peso y repeticiones configurados por el usuario para la primera serie, y los transforma en un objeto JSON compatible con el backend estructurado de la siguiente forma:
    ```json
    {
      "name": "Título de la rutina",
      "desc": "Descripción de la rutina",
      "exercises": [
        { "exerciseId": "UUID-EJERCICIO", "position": 1, "sets": 4, "reps": 12, "restSeconds": 90, "initialWeight": 60.0 }
      ]
    }
    ```
    Este payload formateado se envía mediante un método POST a través de la llamada `CreateRoutineCall` para guardarse definitivamente en la base de datos relacional.

### C. Pantalla de Ejecución del Entrenamiento (`ExecuteRoutineWidget`)

* **Carga de Historial:** Al seleccionar una rutina para entrenar en `RoutinesScreenWidget` , la app realiza una petición GET a `GetRoutineByIdCall`. El backend devuelve las series preconfiguradas junto con el historial del peso levantado en la última sesión realizada.

* **UI Reactiva de Series:** Los ejercicios se listan dinámicamente mediante el componente modular `ExerciseCardRoutineWidget`. Cada serie se representa mediante una fila independiente gobernada por `RowSerieWidget`.

* **Gestión del Timer Interactivo:** Cuando el usuario completa físicamente una serie del ejercicio, presiona el botón de verificación del componente (`Icons.check_circle_outline_outlined`). El componente reacciona cambiando instantáneamente su color de fondo a verde (`Color(0xFF58984E)`) para dar feedback visual  y activa de forma automática un temporizador de cuenta regresiva (`FlutterFlowTimerController`) configurado exactamente con los segundos de descanso asignados a ese ejercicio específico. Una vez que el temporizador finaliza, el usuario sabe que debe iniciar la siguiente serie.

* **Cierre de Sesión:** Al finalizar la sesión, se detiene el cronómetro global de duración (`StopWatchMode.countUp`) , se procesan todas las series completadas por el usuario a través de la función de conversión estática `jsonFormatToSessionExercises()` y se realiza un POST masivo a `saveSessionDataCall` para almacenar la información de rendimiento deportivo de forma permanente en el servidor.

---

## 🛠️ 4. Guía de Conexión y Despliegue Completo con NGROK

Para desplegar la aplicación móvil e interconectarla con el repositorio del Backend expuesto a internet, sigue minuciosamente estos pasos:

1.  **Obtener la URL activa del Backend:** Asegúrate de tener el Backend corriendo en tu máquina local y expuesto mediante NGROK como se detalla en su respectiva guía. Copia la URL generada (ejemplo: `https://abcd-123-45.ngrok-free.dev`).

2.  **Modificar los puntos de acceso de la API en Flutter:** Abre este repositorio frontend en tu entorno de desarrollo (VS Code o Android Studio). Dirígete al archivo centralizado de llamadas de red: `lib/backend/api_requests/api_calls.dart`.

3.  **Aplicar reemplazo global:** Utiliza la combinación de teclas de reemplazo masivo de tu editor (`Ctrl + Shift + H` en Windows/Linux o `Cmd + Shift + H` en macOS). 
 
    * *Buscar:* `https://impose-glamour-that.ngrok-free.dev` (que es la URL de desarrollo por defecto en tu código).
    
    * *Reemplazar por:* **Tu URL pública activa de NGROK** (ej: `https://abcd-123-45.ngrok-free.dev`). Ejecuta el reemplazo en todas las incidencias del archivo.
    
    * *Explicación Técnica:* Al realizar este paso, todas las clases de llamada a la API (`ChangeUserDataGroup`, `RoutinesApiGroup`, `WorkOutGroupGroup`, `LoginCall`, etc.) dirigirán su tráfico de red de forma transparente a través de los servidores seguros de NGROK directamente hacia el puerto `8080` de tu máquina local donde Spring Boot está escuchando.

4.  **Descargar Paquetes del Framework:** Abre una consola de comandos en la raíz de este proyecto frontend (donde reside el archivo `pubspec.yaml`) y ejecuta la descarga e indexación de dependencias de Flutter:

    ```bash
    flutter pub get
    ```

5.  **Compilar y Lanzar la Aplicación:** Abre un emulador de dispositivo móvil en tu entorno de desarrollo o conecta tu teléfono celular físico con la depuración USB activada. Lanza el despliegue del software ejecutando:

    ```bash
    flutter run
    ```

    Flutter compilará el código fuente de Dart a código de máquina nativo (APK para Android o APP para iOS) e instalará de forma automática la plataforma AURA en el dispositivo. La aplicación iniciará de inmediato, permitiendo registrar usuarios, loguearse y operar el sistema en tiempo real comunicándose directamente con la base de datos de tu servidor local a través de internet.
