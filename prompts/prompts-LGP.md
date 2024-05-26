#PROMPTS

*-Prompt:* Quiero que actues como un  Arquitecto de Sistemas y DBA experto en el diseño de sistemas escalables usando DDD. Eres  experto en bases de datos SQL.
Inicialmente quiero que analices el esquema de base de datos que tenemos en este proyecto @prisma 

*-Prompt:* quiero actualizar esta base de datos con nuevas entidades, te voy a facilitar el ERD y quiero que me digas si tienes alguna duda al respecto

*-Prompt:* quiero que optimices esta estructura para normalizarla

*-Prompt:* crees que podriamos normalizarla más? no quiero que apliques demasiada complejidad, pero quiero tener una base de datos normalizada

*-Promtp:* quiero que me resumas en en términos prácticos todas las relaciones de este diagrama ERD

*-Prompt:* quiero modificar el modelo de datos para que en una entrevista pueda participar más de un empleado

*-Prompt:* quiero que revises de nuevo si la estructura de datos @schema.prisma  sigue la normalización de estructuras (1FN, 2FN, 3FN). No quiero que hagas ningun cambio de momento, solo dime qué mejoras harías

*-Prompt:* partiendo de este modelo de datos en Prisma, quiero que me ayudes a generar el ERD en formato mermaid

*-Prompt:* ahora que ya tenemos bien definido el @schema.prisma vamos a realizar la migracion a la base de datos para actualizar el esquema. Ayudame a generar la migracion

*-Prompt:* ayudame a generar INSERTS para esta estructura de datos para poblar todas las tablas de mi base de datos@schema.prisma y poder ejecutar algunas queries para testear

*-Prompt:* teniendo en cuenta la estructura de datos @migration.sql crea algunas queries para este sistema ATS que puedan ser interesantes