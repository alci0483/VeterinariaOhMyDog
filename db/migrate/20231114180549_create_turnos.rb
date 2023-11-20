class CreateTurnos < ActiveRecord::Migration[7.0]
  def change
    create_table :turnos do |t|
      t.string :nombre_perro
      t.boolean :primera_visita
      t.string :tipo_servicio
      t.string :banda_horaria
      t.date :fecha
      t.string :descripcion

      t.timestamps
    end
  end
end
