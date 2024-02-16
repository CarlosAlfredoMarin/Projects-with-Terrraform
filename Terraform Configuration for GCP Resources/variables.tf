variable "project_id" {
  description  = "The project ID where all resources will be launched."
  type         = string
  default      = ""
}

variable "region" {
  type         = string
  default      = "europe-west2"
}

variable "zone" {
  type         = string
  default      = "europe-west2-a"
}

variable "repository_name" {
  description = "Name of the Google Cloud Source Repository to create."
  type        = string
  default     = "repository-1"
}

variable "branch_name" {
  description = "Example branch name used to trigger builds."
  type        = string
  default     = "plan"
}

variable "triggers" {
  description = "Cloud Build triggers."
  type = map(object({
    filename        = string
    included_files  = list(string)
    service_account = string
    substitutions   = map(string)
    template = object({
      branch_name = string
      project_id  = string
      tag_name    = string
    })
  }))
  default  = {}
  nullable = false
}
