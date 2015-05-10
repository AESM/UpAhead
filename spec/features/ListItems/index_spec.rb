require 'rails_helper'

describe "Viewing list items" do
  let!(:task_list) { TaskList.create(title: "Tuesday", description: "Dance my pants off") }

  before do

    visit "/task_lists"
    within "#task_list_#{task_list.id}" do
      click_link "List Items"
    end

  end

  it "displays the task list title" do
  end

  it "displays no list items when the task list is empty" do
    expect(page).to have_content("ListItems#index")
  end

end
