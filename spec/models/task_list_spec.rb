require 'rails_helper'

RSpec.describe TaskList, type: :model do
  it { should have_many(:list_items) }
end
