class TodoItem < ActiveRecord::Base
  belongs_to :todo
  acts_as_list scope: :todo

  def self.create_new_item(list)

  end
end
