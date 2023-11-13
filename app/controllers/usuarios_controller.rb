class UsuariosController < ApplicationController
  def index
    # Lógica para mostrar una lista de usuarios
    @usuarios = User.all
  end

  def show
    # Lógica para mostrar un usuario específico
    @usuario = User.find(params[:id])
  end
end
