class EvitarNulosPerdidosBasedatos < ActiveRecord::Migration[7.0]
  def change
  change_column_null :perdidos, :tamano, false
  change_column_null :perdidos, :edad, false
  change_column_null :perdidos, :ubicacion, false
  change_column_null :perdidos, :nombre, false
  change_column_null :perdidos, :raza, false
  end
end
