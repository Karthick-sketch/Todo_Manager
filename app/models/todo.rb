class Todo < ActiveRecord::Base
  belongs_to :user

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.overdue
    # get to-dos from database that are overdue
    where("due_date < ? and (not completed)", Date.today).order(:due_date)
  end

  def self.due_today
    # get to-dos from database that are due today
    where("due_date = ?", Date.today).order(:due_date)
  end

  def self.due_later
    # get to-dos from database that are due later
    where("due_date > ?", Date.today).order(:due_date)
  end

  def self.completed
    where(completed: true)
  end
end
