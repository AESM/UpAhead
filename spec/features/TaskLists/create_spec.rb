require 'rails_helper'

describe "Creating task lists" do

  def createTaskList(options={})
    options[:title] ||= "A list of the things"
    options[:description] ||= "A description of said things"

    visit "/task_lists"
    click_link "New Task list"
    expect(page).to have_content("New Task List")

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Create Task list"
  end

  it "successfully redirects to the task list index page" do
    visit "/task_lists"
    click_link "New Task list"
    expect(page).to have_content("New Task List")
  end

  it "takes a title and description" do
    createTaskList
    expect(page).to have_content(:description)
  end

  it "raises an error when no title is included" do
    expect(TaskList.count).to eq(0)

    createTaskList title: ""

    expect(page).to have_content("error")
    expect(TaskList.count).to eq(0)

    visit "/task_lists"
    expect(page).to_not have_content("All she wants to do is Dance Daaaance!")
  end

  it "raises an error when the title is shorter than three characters" do
    expect(TaskList.count).to eq(0)

    createTaskList title: "Bl"

    expect(page).to have_content("error")
    expect(TaskList.count).to eq(0)

    visit "/task_lists"
    expect(page).to_not have_content("The wheel in the sky keeps on turnin'!")
  end

  it "raises an error when the title is longer than fifty characters" do
    expect(TaskList.count).to eq(0)

    createTaskList title: "12345678901234567890123456789012345678901234567890!"

    expect(page).to have_content("error")
    expect(TaskList.count).to eq(0)

    visit "/task_lists"
    expect(page).to_not have_content("The Cheat is Overwhelmed!")
  end

  it "raises an error when no description is included" do
    expect(TaskList.count).to eq(0)

    createTaskList description: ""

    expect(page).to have_content("error")
    expect(TaskList.count).to eq(0)

    visit "/task_lists"
    expect(page).to_not have_content("There can be, only None!")
  end

end
