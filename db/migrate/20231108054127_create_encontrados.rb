class CreateEncontrados < ActiveRecord::Migration[7.0]
  def change
    create_table :encontrados do |t|
      t.string :nombre
      t.integer :tamano
      t.string :ubicacion
      t.string :raza

      t.timestamps
    end
  end
end
