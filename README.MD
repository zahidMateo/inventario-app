# AgileInventory

Proyecto de gestión de inventario, con listado dinámico de productos y transacciones, creación y edición de registros, filtros dinámicos y paginación.

## Requisitos
- Node.js >= 18
- Angular CLI >= 20
- .NET SDK >= 7.0 (si tu backend es .NET)
- Base de datos MySQL/PostgreSQL/SQL Server
- Git

## Estructura del repositorio   
inventario/
│
├─ backend/ <- proyecto backend
├─ frontend/ <- proyecto frontend

## Configuración de la base de datos (SQL Server)

1. **Abrir SQL Server Management Studio (SSMS)**  
   Conéctate a tu servidor local (`localhost\SQLEXPRESS` o el nombre de tu instancia).

2. **Ejecutar el script del proyecto**  
   - Abre una nueva consulta y copia el **script del proyecto de inventario**.  
   - Copia y pega el scrip que se encuentra en el proyecto base 
   - **Recomendación:** no ejecutes todo de una sola vez. Hazlo por partes: 
     1. Primero crea la base de datos:  
   

## Ejecución del backend


1. **Abrir el proyecto**  
   Abre la carpeta del backend en tu IDE favorito (Se recomiendo visual studio 2022).

2. **Configurar la conexión a la base de datos**  
   - Abre el archivo `appsettings.json` o el archivo de configuración correspondiente.  
   - Modifica la cadena de conexión (`ConnectionString`) con los datos de tu base de datos local o remota:
    
     "ConnectionStrings": {
       "DefaultConnection": "Server=TU_SERVIDOR;Database=TU_BASE_DE_DATOS;User Id=TU_USUARIO;Password=TU_CONTRASEÑA;"
     }
3. **Restaurar paquetes y compilar**  
   bash
   dotnet restore
   dotnet build

    
   - Guarda los cambios.
   **Ejecutar ambos proyectos simultáneamente**
    Para este proyecto se deben levantar los dos proyectos para su correcto funcionamiento, en este caso son serviceProducst y serviceTransaction
   **Opción 1: Desde Visual Studio**
   - Haz clic derecho en la solución → **Propiedades** → **Proyectos de inicio**.  
   - Selecciona **Varios proyectos de inicio**.  
   - Marca ambos proyectos como **Iniciar** y guarda.  
   - Presiona `F5` o **Iniciar depuración**, y ambos proyectos se levantarán al mismo tiempo.

   **Opción 2: Desde línea de comandos**
   - Abre una terminal para cada proyecto y ejecuta:
     bash
     dotnet run --project ./ProyectoA/ProyectoA.csproj
     
     bash
     dotnet run --project ./ProyectoB/ProyectoB.csproj
     
   - Ahora ambos  estarán corriendo simultáneamente.

4. **Probar la aplicación**  
   - Cada microservicio tendrá su propia URL (`https://localhost:5001`, `https://localhost:5002`, etc.).  
   - Asegúrate de que el frontend apunte a las URLs correctas de cada microservicio.


    
## Ejecución del frontend

1. **Abrir el proyecto**  
   Abre la carpeta del frontend en tu IDE favorito (VS Code recomendado).

2. **Instalar dependencias**  
   Ejecuta: npm install
   Compilar y ejecutar la aplicación: ng serve



