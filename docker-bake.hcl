variable "REPO" {
  default = "d3lta/docker-bake-demo"
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
  
  tags = [tag("latest"), tag("1.0.0")]

  labels = {
    "org.opencontainers.image.source" = "https://github.com/d3lta/docker-bake-demo"
    "org.opencontainers.image.author" = "D3lta"
  }
}