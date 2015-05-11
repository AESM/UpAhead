class ListItem < ActiveRecord::Base
  belongs_to :task_list

  validates :content, presence: true,
                      length: { minimum: 3 }
end
