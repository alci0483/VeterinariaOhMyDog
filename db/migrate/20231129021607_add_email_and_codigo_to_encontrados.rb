class AddEmailAndCodigoToEncontrados < ActiveRecord::Migration[7.0]
  def change
    add_column :encontrados, :email, :string
    add_column :encontrados, :codigo, :string
  end
end
