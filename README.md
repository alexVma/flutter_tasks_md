# 💼 Desafío Técnico Flutter

¡Bienvenido/a al desafío técnico para el puesto de Flutter Developer en!  
Este proyecto es una prueba práctica para evaluar tus habilidades en Flutter, arquitectura limpia, buenas prácticas de desarrollo y experiencia de usuario.

Version de flutter 3.29.3

---

## 🎯 Objetivo

Implementar nuevas funcionalidades sobre una app base de tareas, manteniendo una estructura limpia y escalable.

---

## 🚀 Funcionalidades a Implementar

### 📝 Tarea 1: Crear nueva tarea

Agrega una pantalla para crear nuevas tareas, cumpliendo con los siguientes requisitos:

- Un botón flotante (`FloatingActionButton`) en la pantalla principal para "Agregar tarea".
- Al presionar el botón, navegar a una nueva pantalla con un formulario que contenga:
  - Campo de **título** (obligatorio).
  - Campo de **descripción** (opcional).
  - Checkbox para **tarea completada**.
- Al guardar, la tarea debe ser visible en la lista principal.
- Las tareas deben **persistir localmente** usando alguna de las siguientes opciones (elige una):
  - `SharedPreferences`
  - `Hive`
  - `SQLite`

---

### ✏️ Tarea 2: Personalizar mensaje de bienvenida

Edita el mensaje de bienvenida que aparece en la pantalla inicial por:

```
¡Bienvenido a FlutterTasks! by <<tu nombre>>
```

---

## 📋 Requisitos Técnicos

Tu implementación será evaluada en base a los siguientes criterios:

* ✅ Código limpio y bien organizado.
* ✅ Uso adecuado de arquitectura limpia (Clean Architecture).
* ✅ Manejo apropiado del estado (puedes usar `Bloc`, `Provider`, `Riverpod`, etc.).
* ✅ Buen diseño visual y experiencia de usuario.
* ✅ Buenas prácticas con Git: commits claros, frecuentes y con mensajes significativos.

---

## 🧪 Bonus (Opcional)

Si deseas ir un paso más allá, puedes:

* Agregar animaciones al agregar una nueva tarea.

---

## 📦 Entrega

1. Realiza un **fork** de este repositorio.
2. Implementa las tareas solicitadas.
3. Crea una nueva rama con el formato:
   `<<tuNombre>>/prueba1`
   Ejemplo: `alex/prueba1`
4. Haz un **pull request** hacia el repositorio original con tu solución.

---

¡Gracias por participar y mucho éxito! 🚀