variable "common" {
  type = object({
    project     = string # プロジェクト
    environment = string # 環境名 ( dev、prd など)
    system      = string # システム名
    region      = string # リージョン
    zone        = string # ゾーン
    sops        = any    # sopsのシークレット
  })
  description = "リソース共通の設定値"
}

# variable "vpc" {
#     type = object ({
#         subnet_cidr = string  # サブネットの CIDR 範囲 ( GKE ノード、踏み台ホストが使用する IP 範囲)
#     })
#     description = "VPC の設定値"
# }

# variable "gke" {
#     type = object ({
#         cluster_cidr = string  # GKE Pod が使用する IP 範囲
#         service_cidr = string  # GKE Service が使用する IP 範囲
#         master_cidr  = string  # コントロールプレーンが使用する IP 範囲
#     })
#     description = "GKE の設定値"
# }

# variable "bastion" {
#     type = object ({
#         machine_type    = string  # 踏み台 VM のマシンタイプ
#         ssh_sourcerange = string  # 踏み台 VM に SSH アクセスできるソース IP 範囲
#     })
#     description = "踏み台 VM の設定値"
# }

# variable "project" {
#   description = "プロジェクトID"
#   type        = string
# }

# variable "environment" {
#   description = "環境のプレフィックス"
#   type        = string
# }

# variable "system" {
#   description = "システム名称(-区切り)"
#   type        = string
# }

# variable "sops" {
#   description = "sopsのシークレット"
# }

locals {
  prefix = "${var.common.system}-${var.common.environment}"
}
