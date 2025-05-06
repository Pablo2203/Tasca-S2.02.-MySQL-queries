# 🛠️ Ejercicios de Consultas en Bases de Datos - MySQL

---

## 📄 Descripción - Enunciado del ejercicio

Este proyecto contiene una serie de ejercicios prácticos para trabajar consultas SQL sobre dos bases de datos diferentes: **Tienda** y **Universidad**. En cada ejercicio se propone trabajar con datos bien estructurados utilizando herramientas como JOIN, condiciones, agrupaciones, entre otros conceptos avanzados de SQL. 

### Ejercicios propuestos:
1. **Base de Datos: Tienda**
   - La base de datos incluye dos tablas: `producto` y `fabricante`.
   - El objetivo es realizar consultas como: filtrados, ordenamientos, conversiones de datos, y relaciones entre tablas.

2. **Base de Datos: Universidad**
   - Se plantea trabajar con una base de datos que incluye tablas relacionadas con alumnos, profesores, departamentos, grados y asignaturas.
   - El objetivo es trabajar con operaciones complejas, como jerarquías de relaciones, uniones externas (`LEFT JOIN`, `RIGHT JOIN`), y consultas resumen.

Cada ejercicio está diseñado para poner en práctica conceptos esenciales de SQL, desde lo básico hasta operaciones más avanzadas.

---

## 💻 Tecnologías Utilizadas

El proyecto utiliza únicamente tecnologías relacionadas con bases de datos y sistemas de gestión. Aquí tienes un listado de lo utilizado:

- **MySQL 8.0 o superior.**
- **Scripts SQL** para definición y manipulación de datos (DDL, DML).
- Herramientas de edición y conexión:
  - MySQL Workbench
  - DBeaver o Navicat (opcional)
  - Línea de comandos de MySQL
- Editor de texto para revisar y modificar scripts (por ejemplo, Visual Studio Code).

---

## 📋 Requisitos

Antes de comenzar, asegúrate de cumplir con los siguientes requisitos mínimos:

- **Base de datos MySQL** instalada en tu sistema (versión 8.0 o superior recomendada).
- Una herramienta (Workbench, DBeaver, etc.) para cargar y ejecutar los scripts SQL.
- Acceso a internet para descargar los scripts de este repositorio.
- [Opcional] Un servidor local de bases de datos como **XAMPP o WAMP**.

---

## 🛠️ Instalación

Sigue los pasos indicados para instalar el entorno y cargar las bases de datos:

1. **Clona el repositorio**:
   ```bash
   git clone https://github.com/usuario/consultas_sql_ejercicios.git
   ```

2. **Accede al directorio del proyecto**:
   ```bash
   cd consultas_sql_ejercicios
   ```

3. **Configura el servidor MySQL**:
   - Inicia tu base de datos local (en XAMPP, WAMP o cualquier otro servidor MySQL).
   - Asegúrate de conocer tu usuario (`root`) y contraseña (por defecto, no hay contraseña para `root`).

4. **Carga los esquemas de las bases de datos**:
   - Para cargar la base de datos **Tienda**:
     ```bash
     mysql -u root -p < schema_tienda.sql
     ```
   - Para cargar la base de datos **Universidad**:
     ```bash
     mysql -u root -p < schema_universidad.sql
     ```

---

## ▶️ Ejecución

Una vez cargados los esquemas de las bases de datos, puedes comenzar a ejecutar las consultas propuestas:

1. Abre tu herramienta favorita, como **MySQL Workbench** o **DBeaver**.
2. Selecciona la base de datos correspondiente con el comando:
   ```sql
   USE tienda;
   ```
   o
   ```sql
   USE universidad;
   ```
3. Carga y ejecuta las consultas proporcionadas en los archivos:
   - **consultas_tienda.sql** → Ejercicios para la base de datos Tienda.
   - **consultas_universidad.sql** → Ejercicios para la base de datos Universidad.
4. Inspecciona los resultados en tu herramienta. Cada consulta está diseñada para devolver una salida específica basada en las tablas proporcionadas.

---

## 🌐 Despliegue

Este proyecto no requiere un despliegue tradicional porque se ejecuta localmente en tu entorno MySQL. Sin embargo, si deseas compartir los resultados con un equipo o desplegarlo en un servidor remoto:

1. **Exporta las bases de datos**: Usa la herramienta `mysqldump` para exportar las bases de datos.
   ```bash
   mysqldump -u root -p tienda > tienda.sql
   mysqldump -u root -p universidad > universidad.sql
   ```
2. **Sube los archivos SQL al servidor remoto**.
3. **Importa las bases de datos en el servidor remoto** con:
   ```bash
   mysql -u usuario -p < tienda.sql
   mysql -u usuario -p < universidad.sql
   ```
4. Comparte los scripts SQL de las consultas con tu equipo para su ejecución.

---

## 🤝 Contribuciones

Si deseas contribuir a este proyecto, sigue las siguientes pautas:

1. Crea un `fork` de este repositorio.
2. Realiza tus modificaciones en una rama nueva:
   ```bash
   git checkout -b mi_aportacion
   ```
3. Documenta claramente los cambios en el código y en este archivo `README.md`.
4. Envía un **pull request** describiendo claramente tus contribuciones.

¡Serán bienvenidas las sugerencias, mejoras en las consultas o documentación ampliada del proyecto!

---

¡Gracias por explorar este proyecto! 🚀 Si tienes alguna pregunta o necesitas ayuda, no dudes en contactarme.
