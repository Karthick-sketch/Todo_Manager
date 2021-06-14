class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true

  belongs_to :user

  def self.overdue
    # get to-dos from database that are overdue
    where("due_date < ? and (not completed)", Date.today).order(:due_date)
  end

  def self.due_today
    # get to-dos from database that are due today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    # get to-dos from database that are due later
    where("due_date > ?", Date.today).order(:due_date)
  end

  def self.completed
    where(completed: true)
  end
end
