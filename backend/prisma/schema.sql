-- Creación de la tabla COMPANY
CREATE TABLE COMPANY (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Creación de la tabla INTERVIEW_FLOW
CREATE TABLE INTERVIEW_FLOW (
    id INT PRIMARY KEY,
    description VARCHAR(255)
);

-- Creación de la tabla INTERVIEW_TYPE
CREATE TABLE INTERVIEW_TYPE (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
);

-- Creación de la tabla POSITION
CREATE TABLE POSITION (
    id INT PRIMARY KEY,
    company_id INT,
    interview_flow_id INT,
    title VARCHAR(255),
    description TEXT,
    status VARCHAR(50),
    is_visible BOOLEAN,
    location VARCHAR(255),
    job_description TEXT,
    requirements TEXT,
    responsibilities TEXT,
    salary_min NUMERIC,
    salary_max NUMERIC,
    employment_type VARCHAR(50),
    benefits TEXT,
    company_description TEXT,
    application_deadline DATE,
    contact_info VARCHAR(255),
    FOREIGN KEY (company_id) REFERENCES COMPANY(id),
    FOREIGN KEY (interview_flow_id) REFERENCES INTERVIEW_FLOW(id)
);

-- Creación de la tabla EMPLOYEE
CREATE TABLE EMPLOYEE (
    id INT PRIMARY KEY,
    company_id INT,
    name VARCHAR(255),
    email VARCHAR(255),
    role VARCHAR(255),
    is_active BOOLEAN,
    FOREIGN KEY (company_id) REFERENCES COMPANY(id)
);

-- Creación de la tabla INTERVIEW_STEP
CREATE TABLE INTERVIEW_STEP (
    id INT PRIMARY KEY,
    interview_flow_id INT,
    interview_type_id INT,
    name VARCHAR(255),
    order_index INT,
    FOREIGN KEY (interview_flow_id) REFERENCES INTERVIEW_FLOW(id),
    FOREIGN KEY (interview_type_id) REFERENCES INTERVIEW_TYPE(id)
);

-- Creación de la tabla CANDIDATE
CREATE TABLE CANDIDATE (
    id INT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(100)
);

-- Creación de la tabla EDUCATION
CREATE TABLE EDUCATION (
    id INT PRIMARY KEY,
    institution VARCHAR(100),
    title VARCHAR(250),
    startDate TIMESTAMP,
    endDate TIMESTAMP,
    candidateId INT,
    FOREIGN KEY (candidateId) REFERENCES CANDIDATE(id)
);

-- Creación de la tabla WORK_EXPERIENCE
CREATE TABLE WORK_EXPERIENCE (
    id INT PRIMARY KEY,
    company VARCHAR(100),
    position VARCHAR(100),
    description VARCHAR(200),
    startDate TIMESTAMP,
    endDate TIMESTAMP,
    candidateId INT,
    FOREIGN KEY (candidateId) REFERENCES CANDIDATE(id)
);

-- Creación de la tabla RESUME
CREATE TABLE RESUME (
    id INT PRIMARY KEY,
    filePath VARCHAR(500),
    fileType VARCHAR(50),
    uploadDate TIMESTAMP,
    candidateId INT,
    FOREIGN KEY (candidateId) REFERENCES CANDIDATE(id)
);

-- Creación de la tabla APPLICATION
CREATE TABLE APPLICATION (
    id INT PRIMARY KEY,
    position_id INT,
    candidate_id INT,
    application_date DATE,
    status VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (position_id) REFERENCES POSITION(id),
    FOREIGN KEY (candidate_id) REFERENCES CANDIDATE(id)
);

-- Creación de la tabla INTERVIEW
CREATE TABLE INTERVIEW (
    id INT PRIMARY KEY,
    application_id INT,
    interview_step_id INT,
    employee_id INT,
    interview_date DATE,
    result VARCHAR(255),
    score INT,
    notes TEXT,
    FOREIGN KEY (application_id) REFERENCES APPLICATION(id),
    FOREIGN KEY (interview_step_id) REFERENCES INTERVIEW_STEP(id),
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(id)
);

-- Índices para mejorar el rendimiento de las consultas
CREATE INDEX idx_employee_company_id ON EMPLOYEE(company_id);
CREATE INDEX idx_position_company_id_is_visible ON POSITION(company_id, is_visible);
CREATE INDEX idx_application_position_id_candidate_id ON APPLICATION(position_id, candidate_id);
CREATE INDEX idx_interview_application_id ON INTERVIEW(application_id);
CREATE INDEX idx_education_candidate_id ON EDUCATION(candidateId);
CREATE INDEX idx_work_experience_candidate_id ON WORK_EXPERIENCE(candidateId);
CREATE INDEX idx_resume_candidate_id ON RESUME(candidateId);
