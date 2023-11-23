class AddFechaToDesparasitacions < ActiveRecord::Migration[7.0]
  def change
    add_column :desparasitacions, :fecha, :string
  end
end
