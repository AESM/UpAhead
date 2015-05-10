class TaskList < ActiveRecord::Base
  validates :title, presence: true, length: { in: 3..50,
    too_short: "must have at least %{count} characters",
    too_long: "can have %{count} characters at most" }
end
