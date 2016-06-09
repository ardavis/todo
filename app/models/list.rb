class List < ActiveRecord::Base
  validates :name, presence: true

  has_many :todos

  def incomplete_todos
    todos.incomplete
  end

  def completed_todos
    todos.completed
  end

  def date_less_than_a_week
    todos.incomplete.where("due_date < ?", Time.now + 7.days)
  end

  def date_more_than_a_week
    todos.incomplete.where("due_date >= ?", Time.now + 7.days)
  end

end
