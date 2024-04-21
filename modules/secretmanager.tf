# ---------------------------------------------------------
# Buildkite agent stack
# ---------------------------------------------------------

resource "google_secret_manager_secret" "buildkite_agent_stack_buildkite_token" {
  secret_id = "buildkite-agent-stack-buildkite-token"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "buildkite_agent_stack_buildkite_token" {
  secret      = google_secret_manager_secret.buildkite_agent_stack_buildkite_token.id
  secret_data = var.common.sops.data["secrets.buildkite_agent_stack.buildkite_token"]
}

resource "google_secret_manager_secret" "buildkite_agent_stack_agent_token" {
  secret_id = "buildkite-agent-stack-agent-token"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "buildkite_agent_stack_agent_token" {
  secret      = google_secret_manager_secret.buildkite_agent_stack_agent_token.id
  secret_data = var.common.sops.data["secrets.buildkite_agent_stack.agent_token"]
}

resource "google_secret_manager_secret" "buildkite_agent_stack_id_rsa" {
  secret_id = "buildkite-agent-stack-id-rsa"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "buildkite_agent_stack_id_rsa" {
  secret      = google_secret_manager_secret.buildkite_agent_stack_id_rsa.id
  secret_data = var.common.sops.data["secrets.buildkite_agent_stack.id_rsa"]
}
