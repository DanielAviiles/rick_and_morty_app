# rick_and_morty_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

## Commands to functional project
Se deben correr los siguientes comandos para levantar el proyecto. Adicional
El proyecto usa una herramienta llamada fvm para el control de versiones de
flutter SDK. Por otro lado, el proyecto usa Nullsafty por lo tanto, esta
basado en el flutter sdk 3.3.4. Ejecutar los siguientes comandos: (En caso de tener
fvm, anteponer "fvm" en flutter, es decir, un ejemplo sería "fvm flutter clean")
  * flutter clean
  * flutter pub get
  * flutter pub run build_runner build --delete-conflicting-outputs
### Comandos para generar APK en mode release
Para generar APK del proyecto en diferentes arquitecturas [armeabi-v7a, arm64-v8a, x86_64]
se debe correr el siguente comando:
  * flutter build apk --split-per-abi

## Documentación de arquitectura
### [lib/app/core]
Principalmente la arquitectura del proyecto va a base de arquitectura hexagonal
la cual puede ser evidenciada en "[lib/app/core]" donde se puede identificar
una infrastructura que contiene entidades de "Service Client",
entidades de excepción, errores, constantes definidas para mantener control y no ambiguedad.
De igual manera, contiene un gestor de estado personalizado "GenericFieldBloc" basado en
RxDart, donde se manipula para configuracion de validaciones.

También se definen casos de uso metodos globales y widget globales

### [lib/app/data]
Para este caso en particular se define toda la capa de dominio apuntando a
implementación de repositorios locales y remotos. Además se encuentran entidades
o modelos implicados para la interpretación de datos en la capa UI

### [lib/app/di]
Para esta capa solo es la implementación de inyección de dependecias

### [lib/app/modules]
En esta capa ya está identificada la UI, donde se implementa una estructura a base de:
  * nombre del modulo
    * application donde se ejecutan querys de modificación y consulta
    * domain donde se encuentra la abstración de repositorios y modelos que se implementará en casos de uso
    * ui donde estará representa la vista

### [lib/app/routes]
Para este nivel de carpeta en el proyecto, solo está identificada y definida la proyección de
rutas de uso a la aplicación
