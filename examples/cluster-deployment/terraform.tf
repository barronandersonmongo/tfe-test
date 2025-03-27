terraform {
  cloud {
    organization = "mdb-flywheel-dev"
    workspaces {
      name = "mdb-flywheel"
    }
  }
}