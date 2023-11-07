# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def create
   self.resource = warden.authenticate!(auth_options)
   if resource && resource.valid_password?(params[:user][:password])
     sign_in(resource_name, resource)
     set_flash_message!(:notice, :signed_in)
     respond_with resource, location: after_sign_in_path_for(resource)
   else
     if resource
       flash.now[:alert] = "Contraseña incorrecta."
     else
       flash.now[:alert] = "Correo electrónico incorrecto."
     end
     render :new
   end
  end
end
