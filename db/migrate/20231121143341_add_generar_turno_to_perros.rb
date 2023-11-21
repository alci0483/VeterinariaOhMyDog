class AddGenerarTurnoToPerros < ActiveRecord::Migration[7.0]
  def change
    add_column :perros, :generar_turno, :integer
  end
end
