class UsuariosController < ApplicationController
     #before_action :authenticate_admin!, only: [:index]

  def index
    # Lógica para mostrar una lista de usuarios
    @usuarios = User.all.order(created_at: :desc)
  end

  def show
    # Lógica para mostrar un usuario específico
    @usuario = User.find(params[:id])
    @perros = @usuario.perros
  end
end
