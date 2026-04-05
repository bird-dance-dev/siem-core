-- CreateTable
CREATE TABLE "events" (
    "id" TEXT NOT NULL,
    "metadata_eventTimestamp" TIMESTAMP(3) NOT NULL,
    "metadata_eventType" TEXT NOT NULL,
    "metadata_logType" TEXT NOT NULL,
    "metadata_vendorName" TEXT NOT NULL,
    "metadata_productName" TEXT NOT NULL,
    "metadata_ingestedTimestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "principal_hostname" TEXT,
    "principal_ip" TEXT,
    "principal_user_userid" TEXT,
    "principal_user_email" TEXT,
    "principal_process_pid" TEXT,
    "principal_process_commandLine" TEXT,
    "target_hostname" TEXT,
    "target_ip" TEXT,
    "target_user_userid" TEXT,
    "target_user_email" TEXT,
    "target_url" TEXT,
    "target_resourceName" TEXT,

    CONSTRAINT "events_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "security_results" (
    "id" TEXT NOT NULL,
    "eventId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "severity" TEXT,
    "description" TEXT,
    "category" TEXT,

    CONSTRAINT "security_results_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "events_metadata_eventType_metadata_eventTimestamp_idx" ON "events"("metadata_eventType", "metadata_eventTimestamp");

-- CreateIndex
CREATE INDEX "events_metadata_logType_idx" ON "events"("metadata_logType");

-- CreateIndex
CREATE INDEX "events_principal_user_userid_idx" ON "events"("principal_user_userid");

-- CreateIndex
CREATE INDEX "events_principal_ip_idx" ON "events"("principal_ip");

-- CreateIndex
CREATE INDEX "events_target_ip_idx" ON "events"("target_ip");

-- CreateIndex
CREATE INDEX "security_results_eventId_idx" ON "security_results"("eventId");

-- CreateIndex
CREATE INDEX "security_results_action_idx" ON "security_results"("action");

-- CreateIndex
CREATE INDEX "security_results_severity_idx" ON "security_results"("severity");

-- AddForeignKey
ALTER TABLE "security_results" ADD CONSTRAINT "security_results_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "events"("id") ON DELETE CASCADE ON UPDATE CASCADE;
