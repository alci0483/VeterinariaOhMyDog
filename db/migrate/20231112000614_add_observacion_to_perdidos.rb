class AddObservacionToPerdidos < ActiveRecord::Migration[7.0]
  def change
    add_column :perdidos, :observacion, :string
  end
end
