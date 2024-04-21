variable "project" {
  description = "プロジェクトID"
  type        = string
  default = "sample-dev-401122"
}

variable "environment" {
  description = "環境のプレフィックス"
  type        = string
  default = "dev"
}

variable "system" {
  description = "システム名称(-区切り)"
  type        = string
  default = "foo-bar"
}

locals {
  prefix = "${var.system}-${var.environment}"
}
