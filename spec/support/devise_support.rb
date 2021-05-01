
module ValidUserRequestHelper
  def sign_in_as_a_valid_user(user)
    post user_session_path, params:{ user: {email: user.email, password: user.password }}
  end

  def sign_up_buyer(user)
    get new_user_registration_path, params:{ user: {
      email: user.email,
      username: user.username,
      role_id: user.role_id,
      password: user.password,
      password_confirmation: user.password_confirmation
    }}
  end
end