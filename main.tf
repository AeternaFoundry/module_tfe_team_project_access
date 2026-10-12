resource "tfe_team_project_access" "team_project_accesses" {
  for_each = var.team_project_accesses

  access     = each.value.access
  project_id = each.value.project_id
  team_id    = each.value.team_id

  dynamic "project_access" {
    for_each = each.value.project_access != null ? each.value.project_access : []
    content {
      settings      = project_access.value.settings
      teams         = project_access.value.teams
      variable_sets = project_access.value.variable_sets
    }
  }

  dynamic "workspace_access" {
    for_each = each.value.workspace_access != null ? each.value.workspace_access : []
    content {
      create           = workspace_access.value.create
      delete           = workspace_access.value.delete
      locking          = workspace_access.value.locking
      move             = workspace_access.value.move
      policy_overrides = workspace_access.value.policy_overrides
      run_tasks        = workspace_access.value.run_tasks
      runs             = workspace_access.value.runs
      sentinel_mocks   = workspace_access.value.sentinel_mocks
      state_versions   = workspace_access.value.state_versions
      variables        = workspace_access.value.variables
    }
  }
}

