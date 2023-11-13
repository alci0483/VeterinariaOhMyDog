class CreatePerros < ActiveRecord::Migration[7.0]
  def change
    create_table :perros do |t|
      t.string :nombre
      t.integer :edad
      t.string :raza
      t.string :sexo
      t.string :estado_salud
      t.integer :user_id

      t.timestamps
    end
  end
end
