class Usuarios::OmniauthCallbacksController < Devise::OmniauthCallbacksController  

  def google_oauth2
    usuario = Usuario.from_omniauth(auth)    
    if usuario.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect usuario, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to new_usuario_session_path
    end
  end  

protected  

  def after_omniauth_failure_path_for(_scope)
    new_usuario_session_path
  end  

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end  

private

  def auth
    @auth ||= request.env['omniauth.auth']
  end

end