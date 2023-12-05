class AddEstadoToPerdidos < ActiveRecord::Migration[7.0]
  def change
    add_column :perdidos, :estado, :string
  end
end
