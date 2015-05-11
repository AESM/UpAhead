class TaskList < ActiveRecord::Base
  has_many :list_items

  validates :title, presence: true,
                    length: { in: 3..50,
                    too_short: "must be at least %{count} characters long",
                    too_long: "must not exceed %{count} characters" }
  validates :description, presence: true
end
