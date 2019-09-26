data "tfe_workspace_ids" "test_workspaces" {
  // Getting the ids of three workspaces
  // Here it is a list, you can use ["*"] for both workspaces in that organization
  names = ["my-random_pet-1", "my-random_pet-2", "my-random_pet-3"]
  // Your organization name
  organization = "ORG_NAME"
}

resource "tfe_variable" "test" {
  for_each     = data.tfe_workspace_ids.test_workspaces.ids // for each workspace
  key          = "YOUR_KEY_NAME"                            // name of the variable
  value        = "YOUR_VALUE"                               // value of the variable
  category     = "env"                                      // env for environment variables
  sensitive    = true                                       // write-only
  workspace_id = each.value                                 // each workspace name
}
