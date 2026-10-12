variable "team_project_accesses" {
  description = <<EOT
Map of team_project_accesses, attributes below
Required:
    - access
    - project_id
    - team_id
Optional:
    - project_access (block):
        - settings (optional)
        - teams (optional)
        - variable_sets (optional)
    - workspace_access (block):
        - create (optional)
        - delete (optional)
        - locking (optional)
        - move (optional)
        - policy_overrides (optional)
        - run_tasks (optional)
        - runs (optional)
        - sentinel_mocks (optional)
        - state_versions (optional)
        - variables (optional)
EOT

  type = map(object({
    access     = string
    project_id = string
    team_id    = string
    project_access = optional(list(object({
      settings      = optional(string)
      teams         = optional(string)
      variable_sets = optional(string)
    })))
    workspace_access = optional(list(object({
      create           = optional(bool)
      delete           = optional(bool)
      locking          = optional(bool)
      move             = optional(bool)
      policy_overrides = optional(bool)
      run_tasks        = optional(bool)
      runs             = optional(string)
      sentinel_mocks   = optional(string)
      state_versions   = optional(string)
      variables        = optional(string)
    })))
  }))
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

