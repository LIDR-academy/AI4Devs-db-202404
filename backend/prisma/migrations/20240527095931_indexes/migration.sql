-- CreateIndex
CREATE INDEX "idx_application_candidateId" ON "Application"("candidateId");

-- CreateIndex
CREATE INDEX "idx_application_positionId" ON "Application"("positionId");

-- CreateIndex
CREATE INDEX "idx_application_statusId" ON "Application"("statusId");

-- CreateIndex
CREATE INDEX "idx_candidate_email" ON "Candidate"("email");

-- CreateIndex
CREATE INDEX "idx_employee_companyId" ON "Employee"("companyId");

-- CreateIndex
CREATE INDEX "idx_interview_applicationId" ON "Interview"("applicationId");

-- CreateIndex
CREATE INDEX "idx_interview_interviewDate" ON "Interview"("interviewDate");

-- CreateIndex
CREATE INDEX "idx_position_createdAt" ON "Position"("createdAt");

-- CreateIndex
CREATE INDEX "idx_position_isVisible" ON "Position"("isVisible");
