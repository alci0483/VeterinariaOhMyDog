class ChangeFechaTypeInCastracions < ActiveRecord::Migration[7.0]
  def change
   change_column :castracions, :fecha, :string
 end
end
