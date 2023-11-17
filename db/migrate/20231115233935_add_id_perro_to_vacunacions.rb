class AddIdPerroToVacunacions < ActiveRecord::Migration[7.0]
  def change
    add_column :vacunacions, :perro_id, :integer
  end
end
