class AddUserIdToTurnos < ActiveRecord::Migration[7.0]
  def change
    add_column :turnos, :user_id, :integer
  end
end
