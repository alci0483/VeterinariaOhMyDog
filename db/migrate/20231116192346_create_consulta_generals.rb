class CreateConsultaGenerals < ActiveRecord::Migration[7.0]
  def change
    create_table :consulta_generals do |t|
      t.text :descripcion
      t.date :fecha
      t.integer :perro_id

      t.timestamps
    end
  end
end
