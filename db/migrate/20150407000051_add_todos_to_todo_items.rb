class AddTodosToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :todo_id, :integer, index: true
  end
end
