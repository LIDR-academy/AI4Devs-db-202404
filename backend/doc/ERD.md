# Diagrama ERD

```
erDiagram
    COMPANY {
        int id PK
        string name
    }
    PERSON {
        int id PK
        string firstName
        string lastName
        string role_id FK
        boolean is_active
        int company_id FK
    }
    ROLE {
        int id PK
        string name
    }
    POSITION {
        int id PK
        int company_id FK
        int interview_flow_id FK
        string title
        string status_id FK
        boolean is_visible
        string location 
        numeric salary_min
        numeric salary_max
        date application_deadline
        string contact_info
    }
    JOB_DETAILS {
        int id PK
        int position_id FK
        text description
        text job_description
        text requirements
        text responsibilities
        text benefits
        text company_description
    }
    STATUS {
        int id PK
        string name
    }
    INTERVIEW_FLOW {
        int id PK
        string description
    }
    INTERVIEW_STEP {
        int id PK
        int interview_flow_id FK
        int interview_type_id FK
        string name
        int order_index
    }
    INTERVIEW_TYPE {
        int id PK
        string name
        text description
    }
    APPLICATION {
        int id PK
        int position_id FK
        int person_id FK
        date application_date
        string status_id FK
        text notes
    }
    INTERVIEW {
        int id PK
        int application_id FK
        int interview_step_id FK
        int person_id FK
        date interview_date
        string result
        int score
        text notes
    }
    EDUCATION {
        int id PK
        string institution
        string title
        timestamp startDate
        timestamp endDate
        int personId FK
    }
    WORK_EXPERIENCE {
        int id PK
        string company
        string position
        string description
        timestamp startDate
        timestamp endDate
        int personId FK
    }
    RESUME {
        int id PK
        string filePath
        string fileType
        timestamp uploadDate
        int personId FK
    }
    CONTACT_INFO {
        int id PK
        int person_id FK
        string phone
        string address
        string email
    }

    COMPANY ||--o{ PERSON : employs
    COMPANY ||--o{ POSITION : offers
    POSITION ||--|| INTERVIEW_FLOW : assigns
    INTERVIEW_FLOW ||--o{ INTERVIEW_STEP : contains
    INTERVIEW_STEP ||--|| INTERVIEW_TYPE : uses
    POSITION ||--o{ APPLICATION : receives
    PERSON ||--o{ APPLICATION : submits
    APPLICATION ||--o{ INTERVIEW : has
    INTERVIEW ||--|| INTERVIEW_STEP : consists_of
    PERSON ||--o{ INTERVIEW : conducts
    PERSON ||--o{ EDUCATION : has
    PERSON ||--o{ WORK_EXPERIENCE : has
    PERSON ||--o{ RESUME : has
    PERSON ||--o{ CONTACT_INFO : has
    POSITION ||--|| JOB_DETAILS : "FK"
    ROLE ||--o{ PERSON : "FK"
    STATUS ||--o{ POSITION : "FK"
    STATUS ||--o{ APPLICATION : "FK"
```
### Datos de prueba

```
-- Insertar datos en la tabla Company
INSERT INTO "Company" ("name") VALUES ('Tech Innovations Inc.');

-- Insertar datos en la tabla Role
INSERT INTO "Role" ("name") VALUES ('Developer'), ('Manager'), ('HR');

-- Insertar datos en la tabla Person
INSERT INTO "Person" ("firstName", "lastName", "isActive", "companyId", "roleId") 
VALUES ('John', 'Doe', TRUE, 1, 1), ('Jane', 'Smith', TRUE, 1, 2);

-- Insertar datos en la tabla Status
INSERT INTO "Status" ("name") VALUES ('Active'), ('Closed');

-- Insertar datos en la tabla InterviewFlow
INSERT INTO "InterviewFlow" ("description") VALUES ('Initial Screening'), ('Technical Interview');

-- Insertar datos en la tabla InterviewType
INSERT INTO "InterviewType" ("name", "description") VALUES ('Phone', 'Phone screening interview'), ('Onsite', 'Onsite technical interview');

-- Insertar datos en la tabla InterviewStep
INSERT INTO "InterviewStep" ("interviewFlowId", "interviewTypeId", "name", "orderIndex") 
VALUES (1, 1, 'Phone Screening', 1), (2, 2, 'Onsite Interview', 2);

-- Insertar datos en la tabla Position
INSERT INTO "Position" ("companyId", "interviewFlowId", "title", "statusId", "isVisible", "location", "salaryMin", "salaryMax", "applicationDeadline", "contactInfo") 
VALUES (1, 1, 'Software Engineer', 1, TRUE, 'Remote', 60000, 90000, '2023-12-31', 'contact@techinnovations.com');

-- Insertar datos en la tabla JobDetails
INSERT INTO "JobDetails" ("positionId", "description", "jobDescription", "requirements", "responsibilities", "benefits", "companyDescription") 
VALUES (1, 'Develop innovative software solutions.', 'Full stack software development', 'Experience with React and Node.js', 'Develop and maintain web applications', 'Health insurance, Paid time off', 'We are a leading tech company focusing on cloud solutions.');

-- Insertar datos en la tabla Application
INSERT INTO "Application" ("positionId", "personId", "applicationDate", "statusId", "notes") 
VALUES (1, 1, '2023-01-01', 1, 'Very promising candidate');

-- Insertar datos en la tabla Interview
INSERT INTO "Interview" ("applicationId", "interviewStepId", "personId", "interviewDate", "result", "score", "notes") 
VALUES (1, 1, 1, '2023-01-10', 'Passed', 85, 'Good communication skills');

-- Insertar datos en la tabla ContactInfo
INSERT INTO "ContactInfo" ("personId", "phone", "address", "email") 
VALUES (1, '123-456-7890', '1234 Main St, Anytown, USA', 'john.doe@email.com');

-- Insertar datos en la tabla Education
INSERT INTO "Education" ("personId", "institution", "title", "startDate", "endDate") 
VALUES (1, 'State University', 'BSc Computer Science', '2018-08-01', '2022-05-15');

-- Insertar datos en la tabla WorkExperience
INSERT INTO "WorkExperience" ("personId", "company", "position", "description", "startDate", "endDate") 
VALUES (1, 'Previous Employer', 'Junior Developer', 'Worked on various projects', '2022-06-01', '2023-01-01');

-- Insertar datos en la tabla Resume
INSERT INTO "Resume" ("personId", "filePath", "fileType", "uploadDate") 
VALUES (1, '/path/to/resume.pdf', 'PDF', '2023-01-02');
```

### Queries 

```
-- Consultar todos los empleados de una compañía específica:
SELECT p."firstName", p."lastName", r."name" AS role
FROM "Person" p
JOIN "Role" r ON p."roleId" = r.id
WHERE p."companyId" = 1;
  
-- Obtener detalles de las posiciones abiertas, incluyendo el flujo de entrevistas:
SELECT pos."title", pos."location", pos."salaryMin", pos."salaryMax", iflow."description" AS interviewFlow
FROM "Position" pos
JOIN "InterviewFlow" iflow ON pos."interviewFlowId" = iflow.id
WHERE pos."isVisible" = TRUE;

-- Listar todas las aplicaciones y su estado para una posición específica:
SELECT a."applicationDate", s."name" AS status, p."firstName", p."lastName"
FROM "Application" a
JOIN "Status" s ON a."statusId" = s.id
JOIN "Person" p ON a."personId" = p.id
WHERE a."positionId" = 1;

-- Detalles de la entrevista para un candidato específico:
SELECT i."interviewDate", it."name" AS interviewType, i."result", i."score"
FROM "Interview" i
JOIN "InterviewStep" istep ON i."interviewStepId" = istep.id
JOIN "InterviewType" it ON istep."interviewTypeId" = it.id
WHERE i."personId" = 1;

-- Información de contacto y educación de un empleado:
SELECT ci."phone", ci."email", e."institution", e."title"
FROM "ContactInfo" ci
JOIN "Education" e ON ci."personId" = e."personId"
WHERE ci."personId" = 1;

-- Experiencia laboral de los empleados:
SELECT p."firstName", p."lastName", we."company", we."position", we."description"
FROM "WorkExperience" we
JOIN "Person" p ON we."personId" = p.id;

```