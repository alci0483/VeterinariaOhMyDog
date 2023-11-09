class AddIdUserToPerdidos < ActiveRecord::Migration[7.0]
  def change
    add_column :perdidos, :user_id, :integer
  end
end
  
