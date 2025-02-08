variable "REPO" {
  default = "ghcr.io/d3lta/docker-bake-demo"
}

function "tag" {
  params = [tag]
  result = ["${REPO}:${tag}"]
}

group "default" {
  targets = ["app"]
}

target "app" {
  context = "."
  dockerfile = "Dockerfile"
  
  args = {
    NODE_VERSION = "22"
  }

  platforms = ["linux/amd64"]
  
  tags = tag("latest")

  labels = {
    "org.opencontainers.image.source" = "https://github.com/d3lta/docker-bake-demo"
    "org.opencontainers.image.author" = "D3lta"
  }
}