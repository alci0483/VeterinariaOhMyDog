class AddMotivoRechazoToTurnos < ActiveRecord::Migration[7.0]
  def change
    add_column :turnos, :motivo_rechazo, :string
  end
end
