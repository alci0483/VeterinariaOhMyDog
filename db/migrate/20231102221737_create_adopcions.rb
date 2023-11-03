class CreateAdopcions < ActiveRecord::Migration[7.0]
  def change
    create_table :adopcions do |t|
      t.string :nombre
      t.integer :tamanio
      t.integer :edad
      t.string :ubicacion
      t.string :raza

      t.timestamps
    end
  end
end
