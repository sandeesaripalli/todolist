class Todo < ActiveRecord::Base
  has_many :todo_items, -> {order('position ASC')}
end
