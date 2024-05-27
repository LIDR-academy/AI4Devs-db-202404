use the following mermaid diagram to updathe the database schemas from @schema.prisma 

```mermaid
erDiagram
     COMPANY {
         int id PK
         string name
     }
     EMPLOYEE {
         int id PK
         int company_id FK
         string name
         string email
         string role
         boolean is_active
     }
     POSITION {
         int id PK
         int company_id FK
         int interview_flow_id FK
         string title
         text description
         string status
         boolean is_visible
         string location
         text job_description
         text requirements
         text responsibilities
         numeric salary_min
         numeric salary_max
         string employment_type
         text benefits
         text company_description
         date application_deadline
         string contact_info
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
     CANDIDATE {
         int id PK
         string firstName
         string lastName
         string email
         string phone
         string address
     }
     APPLICATION {
         int id PK
         int position_id FK
         int candidate_id FK
         date application_date
         string status
         text notes
     }
     INTERVIEW {
         int id PK
         int application_id FK
         int interview_step_id FK
         int employee_id FK
         date interview_date
         string result
         int score
         text notes
     }

     COMPANY ||--o{ EMPLOYEE : employs
     COMPANY ||--o{ POSITION : offers
     POSITION ||--|| INTERVIEW_FLOW : assigns
     INTERVIEW_FLOW ||--o{ INTERVIEW_STEP : contains
     INTERVIEW_STEP ||--|| INTERVIEW_TYPE : uses
     POSITION ||--o{ APPLICATION : receives
     CANDIDATE ||--o{ APPLICATION : submits
     APPLICATION ||--o{ INTERVIEW : has
     INTERVIEW ||--|| INTERVIEW_STEP : consists_of
     EMPLOYEE ||--o{ INTERVIEW : conducts
```
- - -

```
Error code: P1012
error: Error parsing attribute "@relation": The relation fields `position` on Model `InterviewFlow` and `interviewFlow` on Model `Position` both provide the `references` argument in the @relation attribute. You have to provide it only on one of the two fields.
  -->  prisma\schema.prisma:107
```
Please help me debug this code. Only debug the latest error.

- - - 

Nota: despues de un par de intentos el asistentente no encontro el error,era: 
```
model Position {
  ...
  interviewFlowId     Int             @unique
  interviewFlow       InterviewFlow   @relation(fields: [interviewFlowId], references: [id])
  ...
}

model InterviewFlow {
  ...
  position        Position?       
}
```
- - - 
Would you suggest any index on any table to improve performance?

ChatGPT4 suggestions:
1. Candidate Table
    Email
    Name
2. Company Table
    Name
3. Position Table
    CompanyID
    InterviewFlowID
4. Employee Table
    CompanyID
    Email
5. Education, WorkExperience, Resume, Application, and Interview Tables
    CandidateID and other Foreign Keys
6. Application and Interview Tables
    PositionID, ApplicationID, InterviewStepID, and EmployeeID
- - - 
Add indexes on the following fields:
Position.companyId
Application.positionId
Education.candidateId
Experience.candidateId
Interview.applicationId
