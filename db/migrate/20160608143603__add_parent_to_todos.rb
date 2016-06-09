class AddParentToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :parent_id, :integer
  end
end
