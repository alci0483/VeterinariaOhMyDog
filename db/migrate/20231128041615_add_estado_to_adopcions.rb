class AddEstadoToAdopcions < ActiveRecord::Migration[7.0]
  def change
    add_column :adopcions, :estado, :string
  end
end
