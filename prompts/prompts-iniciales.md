## Prompts

Conversación completa [aquí](https://chatgpt.com/share/21683d27-24cb-48c5-81d1-8231839adff8)

1. Eres un DBA experto en el diseño de sistemas escalables usando DDD, normalización y migración de BDs. A continuación tienes un ERD en mermaid:
    - Me dio el SQL y los indices
2. Ahora, tengo este archivo de prisma (que está entre almohadillas) que tiene modelos ya existentes, actualiza este archivo prisma, los archivos sql y los indices propuestos para incluir lo ya existente
    - Refactorizo el [prisma](../backend/prisma/schema.prisma) con lo ya creado, y agregó nuevos indices pero no creo el SQL actualizado
3. genera los sql scripts que mencionaste
    - Aqui si los hizo
4. noto que tienes REFERENCES a tablas que aun no se crean (o si pero despues) modifica el SQL para que esto no suceda y dame uno completo y unificado
   - Me dio el [Sql](../backend/prisma/schema.sql) correctamente
5. crea otro sql en base al que diste con algunos insert de prueba para testear que todo esta funcionando correctamente
   - La [data](../backend/prisma/data_test.sql) se insertó correctamente
