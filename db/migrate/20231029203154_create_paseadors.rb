class CreatePaseadors < ActiveRecord::Migration[7.0]
  def change
    create_table :paseadors do |t|
      t.string :nombre
      t.string :apellido
      t.string :horarios
      t.string :ubicacion
      t.string :contacto

      t.timestamps
    end
  end
end
