-- Insertar datos en la tabla Company
INSERT INTO Company (name) VALUES ('Tech Solutions'), ('Innovative Labs');

-- Insertar datos en la tabla EmploymentType
INSERT INTO EmploymentType (typeName) VALUES ('Full-Time'), ('Part-Time'), ('Contract');

-- Insertar datos en la tabla PositionStatus
INSERT INTO PositionStatus (statusName) VALUES ('Open'), ('Closed'), ('Pending');

-- Insertar datos en la tabla InterviewType
INSERT INTO InterviewType (name, description) VALUES 
('Technical', 'Technical interview to assess coding skills'),
('HR', 'HR interview to assess cultural fit');

-- Insertar datos en la tabla InterviewFlow
INSERT INTO InterviewFlow (description) VALUES 
('Standard Hiring Flow'),
('Senior Hiring Flow');

-- Insertar datos en la tabla Position
INSERT INTO Position (companyId, interviewFlowId, title, description, statusId, isVisible, location, jobDescription, requirements, responsibilities, salaryMin, salaryMax, employmentTypeId, benefits, companyDescription, applicationDeadline, contactInfo) VALUES 
(1, 1, 'Software Engineer', 'Develop and maintain software applications.', 1, true, 'New York', 'Full stack development', 'JavaScript, React, Node.js', 'Develop, test, deploy', 70000, 90000, 1, 'Health insurance, 401k', 'Tech Solutions is a leading software development firm.', '2024-12-31', 'hr@techsolutions.com'),
(2, 2, 'Project Manager', 'Manage software projects.', 1, true, 'San Francisco', 'Project management', 'Agile, Scrum', 'Manage, coordinate, deliver', 80000, 100000, 1, 'Health insurance, Stock options', 'Innovative Labs focuses on innovative technology solutions.', '2024-12-31', 'hr@innovativelabs.com');

-- Insertar datos en la tabla Employee
INSERT INTO Employee (companyId, name, email, role, isActive) VALUES 
(1, 'John Doe', 'john.doe@techsolutions.com', 'Developer', true),
(2, 'Jane Smith', 'jane.smith@innovativelabs.com', 'Manager', true);

-- Insertar datos en la tabla Candidate
INSERT INTO Candidate (firstName, lastName, email, phone, address) VALUES 
('Alice', 'Johnson', 'alice.johnson@example.com', '1234567890', '123 Main St'),
('Bob', 'Brown', 'bob.brown@example.com', '0987654321', '456 Elm St');

-- Insertar datos en la tabla Education
INSERT INTO Education (institution, title, startDate, endDate, candidateId) VALUES 
('University A', 'BSc Computer Science', '2015-09-01', '2019-06-01', 1),
('University B', 'MBA', '2016-09-01', '2018-06-01', 2);

-- Insertar datos en la tabla WorkExperience
INSERT INTO WorkExperience (company, position, description, startDate, endDate, candidateId) VALUES 
('Company A', 'Junior Developer', 'Worked on various projects', '2019-07-01', '2021-08-01', 1),
('Company B', 'Marketing Manager', 'Led marketing team', '2018-07-01', '2020-08-01', 2);

-- Insertar datos en la tabla Resume
INSERT INTO Resume (filePath, fileType, uploadDate, candidateId) VALUES 
('/resumes/alice_johnson.pdf', 'pdf', '2024-01-01', 1),
('/resumes/bob_brown.pdf', 'pdf', '2024-01-01', 2);

-- Insertar datos en la tabla Application
INSERT INTO Application (positionId, candidateId, applicationDate, status, notes) VALUES 
(1, 1, '2024-01-15', 'Pending', 'First interview scheduled'),
(2, 2, '2024-01-20', 'Pending', 'Awaiting documents');

-- Insertar datos en la tabla Interview
INSERT INTO Interview (applicationId, interviewStepId, employeeId, interviewDate, result, score, notes) VALUES 
(1, 1, 1, '2024-01-25', 'Passed', 85, 'Good technical skills'),
(2, 2, 2, '2024-01-30', 'Pending', NULL, 'Needs to provide more details');
