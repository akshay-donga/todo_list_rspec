json.(user, :id, :email, :name, :city)
json.auth_token user.generate_token if controller_name == "sessions"