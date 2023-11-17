class RemoveIdUserFromVacunacions < ActiveRecord::Migration[7.0]
  def change
    remove_column :vacunacions, :perro_id, :integer
  end
end
