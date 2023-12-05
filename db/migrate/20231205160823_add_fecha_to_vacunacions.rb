class AddFechaToVacunacions < ActiveRecord::Migration[7.0]
  def change
    add_column :vacunacions, :fecha, :date
  end
end
