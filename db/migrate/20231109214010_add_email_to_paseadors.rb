class AddEmailToPaseadors < ActiveRecord::Migration[7.0]
  def change
    add_column :paseadors, :email, :string
  end
end
