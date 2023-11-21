class CreateMensajes < ActiveRecord::Migration[7.0]
  def change
    create_table :mensajes do |t|
      t.string :contenido
      t.integer :user_id

      t.timestamps
    end
  end
end
