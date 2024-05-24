-- Inserciones para la tabla COMPANY
INSERT INTO COMPANY (id, name) VALUES (1, 'Tech Innovations');
INSERT INTO COMPANY (id, name) VALUES (2, 'Health Solutions');

-- Inserciones para la tabla INTERVIEW_FLOW
INSERT INTO INTERVIEW_FLOW (id, description) VALUES (1, 'Standard tech interview flow');
INSERT INTO INTERVIEW_FLOW (id, description) VALUES (2, 'Management interview flow');

-- Inserciones para la tabla INTERVIEW_TYPE
INSERT INTO INTERVIEW_TYPE (id, name, description) VALUES (1, 'Technical', 'Assesses technical skills');
INSERT INTO INTERVIEW_TYPE (id, name, description) VALUES (2, 'Behavioral', 'Assesses behavioral traits');

-- Inserciones para la tabla POSITION
INSERT INTO POSITION (id, company_id, interview_flow_id, title, description, status, is_visible, location, job_description, requirements, responsibilities, salary_min, salary_max, employment_type, benefits, company_description, application_deadline, contact_info)
VALUES (1, 1, 1, 'Software Developer', 'Develop cutting-edge software applications.', 'Open', TRUE, 'Remote', 'Develop applications.', 'Knowledge of programming', 'Code daily', 3000, 5000, 'Full-time', 'Healthcare, Gym membership', 'Tech Innovations is a leading software company.', '2023-12-31', 'hr@techinnovations.com');

-- Inserciones para la tabla EMPLOYEE
INSERT INTO EMPLOYEE (id, company_id, name, email, role, is_active) VALUES (1, 1, 'John Doe', 'johndoe@techinnovations.com', 'HR Manager', TRUE);

-- Inserciones para la tabla INTERVIEW_STEP
INSERT INTO INTERVIEW_STEP (id, interview_flow_id, interview_type_id, name, order_index) VALUES (1, 1, 1, 'Code Review', 1);
INSERT INTO INTERVIEW_STEP (id, interview_flow_id, interview_type_id, name, order_index) VALUES (2, 1, 2, 'Culture Fit', 2);

-- Inserciones para la tabla CANDIDATE
INSERT INTO CANDIDATE (id, firstName, lastName, email, phone, address) VALUES (1, 'Jane', 'Smith', 'janesmith@email.com', '1234567890', '123 Maple St');

-- Inserciones para la tabla EDUCATION
INSERT INTO EDUCATION (id, institution, title, startDate, endDate, candidateId) VALUES (1, 'State University', 'BSc Computer Science', '2020-01-01', '2024-01-01', 1);

-- Inserciones para la tabla WORK_EXPERIENCE
INSERT INTO WORK_EXPERIENCE (id, company, position, description, startDate, endDate, candidateId) VALUES (1, 'Previous Employer', 'Junior Developer', 'Developed applications.', '2022-01-01', '2023-01-01', 1);

-- Inserciones para la tabla RESUME
INSERT INTO RESUME (id, filePath, fileType, uploadDate, candidateId) VALUES (1, '/resumes/jane_smith.pdf', 'PDF', '2023-05-01', 1);

-- Inserciones para la tabla APPLICATION
INSERT INTO APPLICATION (id, position_id, candidate_id, application_date, status, notes) VALUES (1, 1, 1, '2023-05-15', 'Pending', 'Strong candidate');

-- Inserciones para la tabla INTERVIEW
INSERT INTO INTERVIEW (id, application_id, interview_step_id, employee_id, interview_date, result, score, notes)
VALUES (1, 1, 1, 1, '2023-05-20', 'Pass', 85, 'Excellent coding skills');
