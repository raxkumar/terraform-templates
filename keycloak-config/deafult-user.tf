resource "keycloak_user" "user_with_initial_password" {
  realm_id = keycloak_realm.realm.id
  username = "user"  # Provide username 
  enabled  = true

  email      = "user@domain.com"  # Provide email
  first_name = "User"  # Provide first name
  last_name  = "default"  # Provide last name

  initial_password {
    value     = "user"  # Provide initial password
    temporary = false
  }
}
