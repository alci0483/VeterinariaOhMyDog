class EvitarNulosEncontradosBasedatos < ActiveRecord::Migration[7.0]
  def change
  change_column_null :encontrados, :tamano, false
  change_column_null :encontrados, :ubicacion, false
  change_column_null :encontrados, :nombre, false
  change_column_null :encontrados, :raza, false
  end
end
