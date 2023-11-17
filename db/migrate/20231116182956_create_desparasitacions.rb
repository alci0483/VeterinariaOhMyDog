class CreateDesparasitacions < ActiveRecord::Migration[7.0]
  def change
    create_table :desparasitacions do |t|
      t.string :nombre_medicamento
      t.string :tipo_medicamento
      t.integer :dosis
      t.integer :perro_id

      t.timestamps
    end
  end
end
