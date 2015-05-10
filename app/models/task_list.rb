class TaskList < ActiveRecord::Base
  validates :title, presence: true, length: { in: 3..50,
    too_short: "must be at least %{count} characters long",
    too_long: "must not exceed %{count} characters" }
  validates :description, presence: true
end
