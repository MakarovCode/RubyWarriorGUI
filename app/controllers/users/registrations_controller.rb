class Users::RegistrationsController < Devise::RegistrationsController

  def update
  
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    
    params.permit!
    msg = ["Verifica tus datos: "]
    unless current_user.provider.nil?
      resource_updated = current_user.update_without_password(params[:user])
    else
      resource_updated = update_resource(resource, params[:user])
    end
    
    
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      redirect_to after_update_path_for(resource), notice: "Perfil editado correctamente!"
    else
      clean_up_passwords resource
      
      username = User.find_by_username(params[:user][:username])
      email = User.find_by_email(params[:user][:email])
      
      if !username.nil? && username != current_user
        msg << "Este nombre de usuario ha sido tomado por otro usuario!"
      end
      if !email.nil? && email != current_user
        msg << "Este email ya ha sido tomado por otro usuario!"
      end
      if params[:user][:password] != params[:user][:password_confirmation] && current_user.provider.nil?
        msg << "Las contrasenas no son iguales!"
      end
      if !current_user.valid_password?(params[:user][:current_password]) && current_user.provider.nil?
        msg << "Contrasena errada!"
      end
      redirect_to after_update_path_for(resource), alert: msg
    end
  end

  #protected

  def after_update_path_for(resource)
    tutorials_path      
  end    
end