class MainController < ApplicationController
  
  def home
    @cuidadores = Cuidador.all
    @paseadores = Paseador.all
  end
end
