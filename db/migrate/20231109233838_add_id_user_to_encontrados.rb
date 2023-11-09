class AddIdUserToEncontrados < ActiveRecord::Migration[7.0]
  def change
    add_column :encontrados, :user_id, :integer
  end
end
