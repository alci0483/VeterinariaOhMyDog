class AddFechaFinToCampanas < ActiveRecord::Migration[7.0]
  def change
    add_column :campanas, :fecha_fin, :date
  end
end
