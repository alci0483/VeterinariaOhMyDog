class AddUserEstadoToTurnos < ActiveRecord::Migration[7.0]
  def change
    add_column :turnos, :estado_turno, :string
  end
end
