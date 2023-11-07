class AddEmailToCuidadors < ActiveRecord::Migration[7.0]
  def change
    add_column :cuidadors, :email, :string
  end
end
