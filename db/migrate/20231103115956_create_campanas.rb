class CreateCampanas < ActiveRecord::Migration[7.0]
  def change
    create_table :campanas do |t|
      t.string :nombre_campana
      t.string :objetivo
      t.integer :monto
      t.integer :dni_titular_responsable

      t.timestamps
    end
  end
end
