require 'rails_helper'

describe "deleting task lists" do
  let!(:task_list) { TaskList.create(title: "Party!", description: "The list of parties I must attend.") }

  it "successfully destroys the task list" do

    visit "/task_lists"

    within "#task_list_#{task_list.id}" do
      click_link "Destroy"
    end

    expect(page).to_not have_content(task_list.title)
    expect(TaskList.count).to eq(0)
  end

end
