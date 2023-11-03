class AddUserIdToSolicitud < ActiveRecord::Migration[7.0]
  def change
  add_reference :solicituds, :user, foreign_key: true
  end
end
