## IDE: Cursor

# PROMPTS

1. Quiero que actues como un DBA experto en PostgreSQL. Quiero que en base al diagrama ERD, lo conviertas a un script sql, el cual nos servira para realizar algunos procesos de analisis mas adelante.
2. Perfecto, ahora quiero que analices el esquema de base de datos que tenemos en este proyecto en @prisma y combines con el resultado anterior para crear una base de datos unificada. Dame los pasos que vas a realizar y no escribas codigo aun
3. Esta bien, realiza todos los pasos indicados a excepcion del paso 6, ya que lo vamos a implementar posteriormente
4. Listo, crea el nuevo ERD con todas las modificaciones, mejoras y uniones que creas convenientes. Entregame el diagrama en formato mermaid.
5. Listo, ahora teniendo ese nuevo ERD quiero que normalices el esquema de base de datos para que sea coherente, no se replique datos, no haya problemas a futuro con la escabilidad o problemas de mantenimiento. Dame los pasos que vas a realizar y no escribas codigo aun.
6. Perfecto, escribe que cambios que harias para mejorar y normalizar la base de datos, dime que tablas se van a separar y cuales se crearian. @ERD.md 
7. Listo, realiza los puntos 1, 3, 4 y 6. Actualiza el diagrama ERD en formato mermaid @ERD.md 
8. Revisa los siguientes aspectos:
   - Te falto una llave foranea entre POSITION y JOB_DETAILS
   - Te falto crear la tabla STATUS para manejar los diferentes estados  para POSITION y APLICATION
   - No es mejor unir EMPLOYEE y CANDIDATE en una sola tabla y definir el tipo por el rol. Crear una tabla para manejar los roles.
   - Elimina la tabla INTERVIEW_RESULT y dejala como estaba inicialment.
   - En la tabla CONTACT_INFO añade el email
9. Vamos bien, pero corrige los siguientes aspectos:
   - Agrega la llave foranea entre POSITION Y JOB_DETAILS
   - Agrega la llave foranea entre ROLE y PERSON
   - Agrega una llave primaria en la tabla CONTACT_INFO
   - Agrega la tabla STATUS
   - Agrega la llave foranea entre STATUS y POSITION
   - Agrega la llave foranea entre STATUS y APPLICATION
   NOTA: Solo agrega las lineas faltantes al diagrama en mermaid. Pregunta las inquietudes que tengas antes de implementar las modificaciones.

10. Te falto la relacion entre PERSON y COMPANY, crea la relacion y agrega la llave foranea en PERSON.
11. Perfecto, ahora teniendo el diagrama final @ERD.md , actualiza el @schema.prisma.  
    NOTA: Se mantuvo una conversacion con el chat hasta solucionar los errores del esquema
12. Perfecto, ahora teniendo el @scheme, crees necesario añadirle algun tipo de indice par optimizar las consultas?
13. No se debe utilizar en los campos correcto? Crea los indices correctamente crea tanto los indices compuestos como los individuales.
14. Crea datos de pruebas para todas las tablas del esquema.
15. Realiza algunas consultas de prueba para verificar que todo esta funcionando correctamente.
