class List < ActiveRecord::Base
  validates :name, presence: true

  has_many :todos

  def incomplete_todos
    todos.incomplete
  end

  def completed_todos
    todos.completed
  end

end
