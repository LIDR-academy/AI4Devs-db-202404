/*
  Warnings:

  - A unique constraint covering the columns `[interviewTypeId]` on the table `InterviewStep` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[interviewFlowId]` on the table `Position` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[salaryRangeId]` on the table `Position` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[benefitId]` on the table `Position` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[companyDescriptionId]` on the table `Position` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "InterviewStep_interviewFlowId_idx";

-- DropIndex
DROP INDEX "InterviewStep_interviewTypeId_idx";

-- CreateIndex
CREATE UNIQUE INDEX "InterviewStep_interviewTypeId_key" ON "InterviewStep"("interviewTypeId");

-- CreateIndex
CREATE UNIQUE INDEX "Position_interviewFlowId_key" ON "Position"("interviewFlowId");

-- CreateIndex
CREATE UNIQUE INDEX "Position_salaryRangeId_key" ON "Position"("salaryRangeId");

-- CreateIndex
CREATE UNIQUE INDEX "Position_benefitId_key" ON "Position"("benefitId");

-- CreateIndex
CREATE UNIQUE INDEX "Position_companyDescriptionId_key" ON "Position"("companyDescriptionId");
