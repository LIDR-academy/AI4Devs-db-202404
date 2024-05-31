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
         int status_id FK
         int employment_type_id FK
         string title
         text description
         boolean is_visible
         string location
         text job_description
         text requirements
         text responsibilities
         numeric salary_min
         numeric salary_max
         text benefits
         text company_description
         date application_deadline
         string contact_info
     }
     EMPLOYMENT_TYPE {
         int id PK
         string type_name
     }
     POSITION_STATUS {
         int id PK
         string status_name
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
         string first_name
         string last_name
         string email
         string phone
         string address
     }
     EDUCATION {
         int id PK
         string institution
         string title
         date start_date
         date end_date
         int candidate_id FK
     }
     WORK_EXPERIENCE {
         int id PK
         string company
         string position
         text description
         date start_date
         date end_date
         int candidate_id FK
     }
     RESUME {
         int id PK
         string file_path
         string file_type
         date upload_date
         int candidate_id FK
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
     POSITION ||--|| POSITION_STATUS : has_status
     POSITION ||--|| EMPLOYMENT_TYPE : has_type
     INTERVIEW_FLOW ||--o{ INTERVIEW_STEP : contains
     INTERVIEW_STEP ||--|| INTERVIEW_TYPE : uses
     POSITION ||--o{ APPLICATION : receives
     CANDIDATE ||--o{ APPLICATION : submits
     APPLICATION ||--o{ INTERVIEW : has
     INTERVIEW ||--|| INTERVIEW_STEP : consists_of
     EMPLOYEE ||--o{ INTERVIEW : conducts
     CANDIDATE ||--o{ EDUCATION : has
     CANDIDATE ||--o{ WORK_EXPERIENCE : has
     CANDIDATE ||--o{ RESUME : uploads
