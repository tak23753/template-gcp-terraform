# ---------------------------------------------------------
# External secrets operator
# ---------------------------------------------------------

resource "google_service_account" "external_secrets_operator" {
  account_id = "external-secrets-operator"
}

resource "google_project_iam_member" "external_secrets_operator" {
  project = var.common.project
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.external_secrets_operator.email}"
}

resource "google_service_account_iam_member" "external_secrets_operator" {
  service_account_id = google_service_account.external_secrets_operator.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.common.project}.svc.id.goog[external-secrets-operator/external-secrets-operator]"
}

# ---------------------------------------------------------
# Buildkite pipeline
# ---------------------------------------------------------

resource "google_service_account" "buildkite_pipeline" {
  account_id = "buildkite"
}

resource "google_project_iam_member" "buildkite_pipeline" {
  project = var.common.project
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.buildkite_pipeline.email}"
}

resource "google_service_account_iam_member" "buildkite_pipeline" {
  service_account_id = google_service_account.buildkite_pipeline.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.common.project}.svc.id.goog[buildkite/buildkite]"
}
