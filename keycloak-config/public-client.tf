
resource "keycloak_openid_client" "openid_client" {
  realm_id            = keycloak_realm.realm.id
  client_id           = "mavas-web"  # Provide public client name 
  name                = "mavas-web"  # Provide public client name 
  enabled             = true
  standard_flow_enabled = true
  access_type         = "PUBLIC"

  valid_redirect_uris = [
    "http://fe.cdkdemo.tk/*"
  ]

  valid_post_logout_redirect_uris = [
    "http://fe.cdkdemo.tk/*"
  ]

  web_origins = ["+"]

  login_theme = "keycloak"

  # extra_config = {
  #   "key1" = "value1"
  #   "key2" = "value2"
  # }
}