class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :name
      t.integer :position

      t.timestamps null: false
    end
  end
end
