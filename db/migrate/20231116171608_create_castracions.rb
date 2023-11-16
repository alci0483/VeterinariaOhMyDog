class CreateCastracions < ActiveRecord::Migration[7.0]
  def change
    create_table :castracions do |t|
      t.text :descripcion
      t.text :medicamentos
      t.date :fecha
      t.integer :perro_id

      t.timestamps
    end
  end
end
