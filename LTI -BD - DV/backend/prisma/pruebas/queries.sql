-- Query 1: Obtener todos los candidatos que han aplicado a una posición específica
SELECT
    c.id AS candidate_id,
    c.first_name,
    c.last_name,
    c.email,
    a.application_date,
    a.status
FROM
    Application a
JOIN
    Candidate c ON a.candidate_id = c.id
WHERE
    a.position_id = {position_id};  -- Reemplaza {position_id} con el ID de la posición específica

-- Query 2: Obtener el historial de entrevistas de un candidato específico
SELECT
    c.first_name,
    c.last_name,
    p.title AS position_title,
    i.interview_date,
    i.result,
    i.score,
    i.notes
FROM
    Interview i
JOIN
    Application a ON i.application_id = a.id
JOIN
    Candidate c ON a.candidate_id = c.id
JOIN
    Position p ON a.position_id = p.id
WHERE
    c.id = {candidate_id};  -- Reemplaza {candidate_id} con el ID del candidato específico

-- Query 3: Obtener todas las posiciones abiertas y visibles para una empresa específica
SELECT
    p.id AS position_id,
    p.title,
    p.description,
    p.location,
    p.salary_min,
    p.salary_max,
    et.type_name AS employment_type,
    ps.status_name AS position_status
FROM
    Position p
JOIN
    EmploymentType et ON p.employment_type_id = et.id
JOIN
    PositionStatus ps ON p.status_id = ps.id
WHERE
    p.company_id = {company_id}  -- Reemplaza {company_id} con el ID de la empresa específica
    AND p.is_visible = TRUE;

-- Query 4: Obtener el número de aplicaciones por cada posición dentro de una empresa específica
SELECT
    p.title AS position_title,
    COUNT(a.id) AS application_count
FROM
    Position p
LEFT JOIN
    Application a ON p.id = a.position_id
WHERE
    p.company_id = {company_id}  -- Reemplaza {company_id} con el ID de la empresa específica
GROUP BY
    p.title;

-- Query 5: Obtener el estado de todas las aplicaciones de un candidato específico
SELECT
    p.title AS position_title,
    a.application_date,
    a.status
FROM
    Application a
JOIN
    Position p ON a.position_id = p.id
WHERE
    a.candidate_id = {candidate_id};  -- Reemplaza {candidate_id} con el ID del candidato específico

-- Query 6: Obtener los empleados que han conducido entrevistas en un rango de fechas específico
SELECT
    e.id AS employee_id,
    e.name,
    e.email,
    COUNT(i.id) AS interview_count
FROM
    Employee e
JOIN
    Interview i ON e.id = i.employee_id
WHERE
    i.interview_date BETWEEN {start_date} AND {end_date}  -- Reemplaza {start_date} y {end_date} con las fechas específicas
GROUP BY
    e.id, e.name, e.email;

-- Query 7: Obtener las estadísticas de entrevistas por tipo de entrevista
SELECT
    it.name AS interview_type,
    COUNT(is.id) AS interview_count
FROM
    InterviewStep is
JOIN
    InterviewType it ON is.interview_type_id = it.id
JOIN
    Interview i ON is.id = i.interview_step_id
GROUP BY
    it.name;

-- Query 8: Obtener el flujo de entrevistas para una posición específica
SELECT
    p.title AS position_title,
    if.description AS interview_flow_description,
    is.name AS interview_step_name,
    it.name AS interview_type_name,
    is.order_index
FROM
    Position p
JOIN
    InterviewFlow if ON p.interview_flow_id = if.id
JOIN
    InterviewStep is ON if.id = is.interview_flow_id
JOIN
    InterviewType it ON is.interview_type_id = it.id
WHERE
    p.id = {position_id}  -- Reemplaza {position_id} con el ID de la posición específica
ORDER BY
    is.order_index;
