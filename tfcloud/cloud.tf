terraform {
  cloud {
    organization = "Test-Organization8"

    workspaces {
      name = "my-test-workspace"
    }
  }
}
