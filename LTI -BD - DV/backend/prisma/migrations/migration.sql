-- Create Company table
CREATE TABLE Company (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create EmploymentType table
CREATE TABLE EmploymentType (
    id SERIAL PRIMARY KEY,
    type_name VARCHAR(255) NOT NULL
);

-- Create PositionStatus table
CREATE TABLE PositionStatus (
    id SERIAL PRIMARY KEY,
    status_name VARCHAR(255) NOT NULL
);

-- Create InterviewType table
CREATE TABLE InterviewType (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create InterviewFlow table
CREATE TABLE InterviewFlow (
    id SERIAL PRIMARY KEY,
    description VARCHAR(255) NOT NULL
);

-- Create Candidate table
CREATE TABLE Candidate (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(100)
);

-- Create Education table
CREATE TABLE Education (
    id SERIAL PRIMARY KEY,
    institution VARCHAR(100) NOT NULL,
    title VARCHAR(250) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    candidate_id INT NOT NULL,
    FOREIGN KEY (candidate_id) REFERENCES Candidate (id) ON DELETE CASCADE
);

-- Create WorkExperience table
CREATE TABLE WorkExperience (
    id SERIAL PRIMARY KEY,
    company VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    description VARCHAR(200),
    start_date DATE NOT NULL,
    end_date DATE,
    candidate_id INT NOT NULL,
    FOREIGN KEY (candidate_id) REFERENCES Candidate (id) ON DELETE CASCADE
);

-- Create Resume table
CREATE TABLE Resume (
    id SERIAL PRIMARY KEY,
    file_path VARCHAR(500) NOT NULL,
    file_type VARCHAR(50) NOT NULL,
    upload_date DATE NOT NULL,
    candidate_id INT NOT NULL,
    FOREIGN KEY (candidate_id) REFERENCES Candidate (id) ON DELETE CASCADE
);

-- Create Employee table
CREATE TABLE Employee (
    id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    role VARCHAR(255) NOT NULL,
    is_active BOOLEAN NOT NULL,
    FOREIGN KEY (company_id) REFERENCES Company (id) ON DELETE CASCADE
);

-- Create Position table
CREATE TABLE Position (
    id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    interview_flow_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status_id INT NOT NULL,
    is_visible BOOLEAN NOT NULL,
    location VARCHAR(255) NOT NULL,
    job_description TEXT,
    requirements TEXT,
    responsibilities TEXT,
    salary_min NUMERIC NOT NULL,
    salary_max NUMERIC NOT NULL,
    employment_type_id INT NOT NULL,
    benefits TEXT,
    company_description TEXT,
    application_deadline DATE NOT NULL,
    contact_info VARCHAR(255) NOT NULL,
    FOREIGN KEY (company_id) REFERENCES Company (id) ON DELETE CASCADE,
    FOREIGN KEY (interview_flow_id) REFERENCES InterviewFlow (id) ON DELETE CASCADE,
    FOREIGN KEY (status_id) REFERENCES PositionStatus (id) ON DELETE CASCADE,
    FOREIGN KEY (employment_type_id) REFERENCES EmploymentType (id) ON DELETE CASCADE
);

-- Create InterviewStep table
CREATE TABLE InterviewStep (
    id SERIAL PRIMARY KEY,
    interview_flow_id INT NOT NULL,
    interview_type_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    order_index INT NOT NULL,
    FOREIGN KEY (interview_flow_id) REFERENCES InterviewFlow (id) ON DELETE CASCADE,
    FOREIGN KEY (interview_type_id) REFERENCES InterviewType (id) ON DELETE CASCADE
);

-- Create Application table
CREATE TABLE Application (
    id SERIAL PRIMARY KEY,
    position_id INT NOT NULL,
    candidate_id INT NOT NULL,
    application_date DATE NOT NULL,
    status VARCHAR(255) NOT NULL,
    notes TEXT,
    FOREIGN KEY (position_id) REFERENCES Position (id) ON DELETE CASCADE,
    FOREIGN KEY (candidate_id) REFERENCES Candidate (id) ON DELETE CASCADE
);

-- Create Interview table
CREATE TABLE Interview (
    id SERIAL PRIMARY KEY,
    application_id INT NOT NULL,
    interview_step_id INT NOT NULL,
    employee_id INT NOT NULL,
    interview_date DATE NOT NULL,
    result VARCHAR(255),
    score INT,
    notes TEXT,
    FOREIGN KEY (application_id) REFERENCES Application (id) ON DELETE CASCADE,
    FOREIGN KEY (interview_step_id) REFERENCES InterviewStep (id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES Employee (id) ON DELETE CASCADE
);

-- Indexes for performance optimization
CREATE INDEX idx_employee_company_id ON Employee (company_id);
CREATE INDEX idx_position_company_id ON Position (company_id);
CREATE INDEX idx_position_interview_flow_id ON Position (interview_flow_id);
CREATE INDEX idx_position_status_id ON Position (status_id);
CREATE INDEX idx_position_employment_type_id ON Position (employment_type_id);
CREATE INDEX idx_education_candidate_id ON Education (candidate_id);
CREATE INDEX idx_work_experience_candidate_id ON WorkExperience (candidate_id);
CREATE INDEX idx_resume_candidate_id ON Resume (candidate_id);
CREATE INDEX idx_application_position_id ON Application (position_id);
CREATE INDEX idx_application_candidate_id ON Application (candidate_id);
CREATE INDEX idx_interview_application_id ON Interview (application_id);
CREATE INDEX idx_interview_interview_step_id ON Interview (interview_step_id);
CREATE INDEX idx_interview_employee_id ON Interview (employee_id);
