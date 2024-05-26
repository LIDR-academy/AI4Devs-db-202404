-- Insertar datos en la tabla Company
INSERT INTO "Company" ("name") VALUES ('Tech Innovations');

-- Insertar datos en la tabla Address
INSERT INTO "Address" ("street", "city", "state", "country", "postalCode") VALUES ('Calle Falsa 123', 'Ciudad', 'Estado', 'País', '00000');

-- Insertar datos en la tabla ContactInfo
INSERT INTO "ContactInfo" ("phone", "email", "address") VALUES ('1234567890', 'info@techinnovations.com', 'Calle Falsa 123, Ciudad');

-- Insertar datos en la tabla Role
INSERT INTO "Role" ("name", "description") VALUES ('Desarrollador', 'Desarrolla y mantiene software');

-- Insertar datos en la tabla Employee
INSERT INTO "Employee" ("companyId", "roleId", "isActive", "address_id", "contact_info_id") VALUES (1, 1, TRUE, 1, 1);

-- Insertar datos en la tabla Candidate
INSERT INTO "Candidate" ("firstName", "lastName", "email", "phone", "address_id") VALUES ('Ana', 'Martinez', 'ana.martinez@example.com', '1234567890', 1);

-- Insertar datos en la tabla Education
INSERT INTO "Education" ("institution", "title", "startDate", "endDate", "candidateId") VALUES ('Universidad', 'Ingeniería', '2020-01-01', '2024-01-01', 1);

-- Insertar datos en la tabla WorkExperience
INSERT INTO "WorkExperience" ("company", "position", "description", "startDate", "endDate", "candidateId") VALUES ('Empresa', 'Desarrollador', 'Desarrollo de software', '2024-02-01', '2025-02-01', 1);

-- Insertar datos en la tabla Resume
INSERT INTO "Resume" ("filePath", "fileType", "uploadDate", "candidateId") VALUES ('ruta/a/cv.pdf', 'application/pdf', CURRENT_DATE, 1);

-- Insertar datos en la tabla Position
INSERT INTO "Position" ("companyId", "interviewFlowId", "isVisible", "location", "applicationDeadline", "contactInfoId") VALUES (1, 1, TRUE, 'Oficina Central', '2024-12-31', 1);

-- Insertar datos en la tabla InterviewFlow
INSERT INTO "InterviewFlow" ("description") VALUES ('Flujo estándar de entrevistas');

-- Insertar datos en la tabla InterviewType
INSERT INTO "InterviewType" ("name", "description") VALUES ('Técnica', 'Entrevista enfocada en habilidades técnicas');

-- Insertar datos en la tabla JobDetails
INSERT INTO "JobDetails" ("positionId", "description", "jobDescription", "requirements", "responsibilities", "salaryMin", "salaryMax", "employmentType", "benefits", "companyDescription") VALUES (1, 'Descripción completa del puesto y expectativas', 'Descripción detallada del puesto de desarrollador de software', 'Experiencia en desarrollo de software', 'Responsabilidades específicas del puesto', 30000.00, 50000.00, 'Tiempo completo', 'Seguro médico, días de vacaciones pagados', 'Tech Innovations es una empresa líder en innovación tecnológica');

-- Insertar datos en la tabla InterviewStep
INSERT INTO "InterviewStep" ("interviewFlowId", "interviewTypeId", "name", "orderIndex") VALUES (1, 1, 'Primera ronda técnica', 1);

-- Insertar datos en la tabla Application
INSERT INTO "Application" ("positionId", "candidateId", "applicationDate", "status", "notes") VALUES (1, 1, CURRENT_TIMESTAMP, 'En revisión', 'Necesita evaluación adicional');

INSERT INTO "Interview" ("applicationId", "interviewStepId", "interviewDate", "result", "score", "notes", "employeeId") VALUES (1, 1, CURRENT_TIMESTAMP, 'Aprobado', 85, 'Excelente desempeño técnico', 1);

INSERT INTO "EmployeeInterview" ("employeeId", "interviewId") VALUES (1, 1);
