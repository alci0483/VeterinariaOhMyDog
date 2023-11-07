class CreatePerdidos < ActiveRecord::Migration[7.0]
  def change
    create_table :perdidos do |t|
      t.string :nombre
      t.integer :tamano
      t.integer :edad
      t.string :ubicacion
      t.string :raza

      t.timestamps
    end
  end
end
