-- Obtener todos los detalles de los candidatos junto con su educación y experiencia laboral:
SELECT 
    "c"."firstName", "c"."lastName", "c"."email", "c"."phone", 
    "e"."institution", "e"."title", "e"."startDate", "e"."endDate",
    "w"."company", "w"."position", "w"."description", "w"."startDate", "w"."endDate"
FROM "Candidate" AS "c"
LEFT JOIN "Education" AS "e" ON "c"."id" = "e"."candidateId"
LEFT JOIN "WorkExperience" AS "w" ON "c"."id" = "w"."candidateId";

-- Obtener la lista de candidatos que han aplicado a una posición específica y el estado de su aplicación:
SELECT 
    "c"."firstName", "c"."lastName", "a"."status", "a"."applicationDate"
FROM "Application" AS "a"
JOIN "Candidate" AS "c" ON "a"."candidateId" = "c"."id"
WHERE "a"."positionId" = 1;  -- Asegúrate de reemplazar '1' con el ID de la posición deseada

-- Consultar detalles de entrevistas programadas para una fecha específica:
SELECT 
    "i"."interviewDate", "i"."result", "i"."score", "e"."id"
FROM "Interview" AS "i"
JOIN "Employee" AS "e" ON "i"."employeeId" = "e"."id"
WHERE "i"."interviewDate" = '2024-05-26'; -- Asegúrate de reemplazar la fecha con la deseada

-- Listar todos los empleados y sus roles dentro de la empresa:
SELECT 
    "e"."id", "r"."name" AS "roleName", "ci"."email"
FROM "Employee" AS "e"
JOIN "Role" AS "r" ON "e"."roleId" = "r"."id"
JOIN "ContactInfo" AS "ci" ON "e"."contact_info_id" = "ci"."id";

-- Obtener un resumen de las posiciones abiertas y el número de aplicaciones recibidas por cada una:
SELECT 
    "p"."location", "p"."applicationDeadline", COUNT("a"."id") AS "TotalApplications"
FROM "Position" AS "p"
LEFT JOIN "Application" AS "a" ON "p"."id" = "a"."positionId"
GROUP BY "p"."id";
