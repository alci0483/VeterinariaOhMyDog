class AddIdUserToAdopcions < ActiveRecord::Migration[7.0]
  def change
    add_column :adopcions, :user_id, :integer
  end
end
