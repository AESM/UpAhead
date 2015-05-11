require 'rails_helper'

describe "Viewing list items" do
  let!(:task_list) { TaskList.create(title: "Tuesday", description: "Dance my pants off") }

  def visit_task_list(list)

    visit "/task_lists"
    within "#task_list_#{list.id}" do
      click_link "List Items"
    end

  end

  it "displays the task list title as a main heading" do

    visit_task_list(task_list)

    within("h1") do
      expect(page).to have_content(task_list.title)
    end

  end

  it "displays no list items when the task list is empty" do
    visit_task_list(task_list)

    expect(page.all("ul.list_items li").size).to eq(0)
  end

  it "displays list items when the task list has content" do
    task_list.list_items.create(content: "The Sprinkler")
    task_list.list_items.create(content: "The Bart-Man")
    task_list.list_items.create(content: "The Pioneer")

    visit_task_list(task_list)

    expect(page.all("ul.list_items li").size).to eq(3)

    within "ul.list_items" do
      expect(page).to have_content("The Sprinkler")
      expect(page).to have_content("The Bart-Man")
      expect(page).to have_content("The Pioneer")
    end

  end

end
