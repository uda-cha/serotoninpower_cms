class AddColumnToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :ipadress, :string
    add_column :comments, :admin, :boolean
  end
end
