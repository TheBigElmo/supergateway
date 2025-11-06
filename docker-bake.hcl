variable "VERSION" {
  default = "DEV"
}

target "common" {
  context   = "."
  platforms = ["linux/amd64", "linux/arm64"]
}

group "default" {
  targets = ["base", "uvx", "deno", "docker"]
}

target "base" {
  inherits   = ["common"]
  dockerfile = "docker/base.Dockerfile"
  tags = [
    "supercorp/supergateway:latest",
    "supercorp/supergateway:base",
    "supercorp/supergateway:${VERSION}",
    "ghcr.io/supercorp-ai/supergateway:latest",
    "ghcr.io/supercorp-ai/supergateway:base",
    "ghcr.io/supercorp-ai/supergateway:${VERSION}",
    "cs-devops.common.repositories.cloud.sap/tmp/supergateway:latest",
    "cs-devops.common.repositories.cloud.sap/tmp/supergateway:base",
    "cs-devops.common.repositories.cloud.sap/tmp/supergateway:${VERSION}"
  ]
}

target "uvx" {
  inherits   = ["common"]
  depends_on  = ["base"]
  dockerfile = "docker/uvx.Dockerfile"
  contexts = { base = "target:base" }
  tags = [
    "supercorp/supergateway:uvx",
    "supercorp/supergateway:${VERSION}-uvx",
    "ghcr.io/supercorp-ai/supergateway:uvx",
    "ghcr.io/supercorp-ai/supergateway:${VERSION}-uvx",
    "cs-devops.common.repositories.cloud.sap/tmp/supergateway:uvx",
    "cs-devops.common.repositories.cloud.sap/tmp/supergateway:${VERSION}-uvx"
  ]
}

target "deno" {
  inherits   = ["common"]
  depends_on  = ["base"]
  dockerfile = "docker/deno.Dockerfile"
  contexts = { base = "target:base" }
  tags = [
    "supercorp/supergateway:deno",
    "supercorp/supergateway:${VERSION}-deno",
    "ghcr.io/supercorp-ai/supergateway:deno",
    "ghcr.io/supercorp-ai/supergateway:${VERSION}-deno",
    "cs-devops.common.repositories.cloud.sap/tmp/supergateway:deno",
    "cs-devops.common.repositories.cloud.sap/tmp/supergateway:${VERSION}-deno"
  ]
}

target "docker" {
  inherits   = ["common"]
  depends_on  = ["base"]
  dockerfile = "docker/docker.Dockerfile"
  contexts = { base = "target:base" }
  tags = [
    "supercorp/supergateway:docker",
    "supercorp/supergateway:${VERSION}-docker",
    "ghcr.io/supercorp-ai/supergateway:docker",
    "ghcr.io/supercorp-ai/supergateway:${VERSION}-docker",
    "cs-devops.common.repositories.cloud.sap/tmp/supergateway:docker",
    "cs-devops.common.repositories.cloud.sap/tmp/supergateway:${VERSION}-docker"
  ]
}
