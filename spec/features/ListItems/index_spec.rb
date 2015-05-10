require 'rails_helper'

describe "Viewing list items" do
  let!(:task_list) { TaskList.create(title: "Tuesday", description: "Dance my pants off") }

  before do

    visit "/task_lists"
    within "#task_list_#{task_list.id}" do
      click_link "List Items"
    end

  end

  it "displays the task list title as a main heading" do

    within("h1") do
      expect(page).to have_content(task_list.title)
    end

  end

  it "displays no list items when the task list is empty" do
    expect(page.all("ul.list_items li").size).to eq(0)
  end

end
