# frozen_string_literal: true

# app/controllers/admin/registrations_controller.rb
class Admin::RegistrationsController < Devise::RegistrationsController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # Manejar el éxito, redirección, etc.
      redirect_to usuarios_path, notice: 'Usuario registrado exitosamente.'
    else
      # Manejar el error, renderizar el formulario, etc.
    
      render :new, status: :unprocessable_entity
    end
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :address, :phone_number])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :address, :phone_number)
  end
end
