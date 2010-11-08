class ApplicationController < ActionController::Base
  protect_from_forgery

  def clean_up_session
    session[:itens] = nil
    session[:last_action] = nil
    session[:last_id] = nil
  end

  def check_security(resource)
    if resource.respond_to? :user_id
      if resource.user_id != current_user.id
        flash[:error] = "Voce esta tentando acessar um recurso que nao te pertence"        
        redirect_to user_root_path
      end
    end
  end
end
