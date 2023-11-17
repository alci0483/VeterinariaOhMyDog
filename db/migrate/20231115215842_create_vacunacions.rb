class CreateVacunacions < ActiveRecord::Migration[7.0]
  def change
    create_table :vacunacions do |t|
      t.string :tipo_vacuna
      t.string :marca_vacuna
      t.integer :dosis
      t.integer :numero_lote

      t.timestamps
    end
  end
end
