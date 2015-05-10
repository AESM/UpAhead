require 'rails_helper'

describe "Creating task lists" do

  it "successfully redirects to the task list index page" do
    visit "/task_lists"
    click_link "New Task list"
    expect(page).to have_content("New Task List")
  end

  it "takes a title and description" do
    visit "/task_lists"
    click_link "New Task list"
    fill_in "Title", with: "Food to make my belly happy list"
    fill_in "Description", with: "Buy some pizza for my belly!"
    click_button "Create Task list"

    expect(page).to have_content("Food to make my belly happy list")
  end

  it "raises an error when no title is included" do
    expect(TaskList.count).to eq(0)

    visit "/task_lists"
    click_link "New Task list"
    expect(page).to have_content("New Task List")

    fill_in "Title", with: ""
    fill_in "Description", with: "All she wants to do is Dance Daaaance!"
    click_button "Create Task list"

    expect(page).to have_content("error")
    expect(TaskList.count).to eq(0)

    visit "/task_lists"
    expect(page).to_not have_content("All she wants to do is Dance Daaaance!")
  end

  it "raises an error when the title is shorter than three characters" do
    expect(TaskList.count).to eq(0)

    visit "/task_lists"
    click_link "New Task list"
    expect(page).to have_content("New Task List")

    fill_in "Title", with: "Bl"
    fill_in "Description", with: "The wheel in the sky keeps on turnin'!"
    click_button "Create Task list"

    expect(page).to have_content("error")
    expect(TaskList.count).to eq(0)

    visit "/task_lists"
    expect(page).to_not have_content("The wheel in the sky keeps on turnin'!")
  end

  it "raises an error when the title is longer than fifty characters" do
    expect(TaskList.count).to eq(0)

    visit "/task_lists"
    click_link "New Task list"
    expect(page).to have_content("New Task List")

    fill_in "Title", with: "12345678901234567890123456789012345678901234567890!"
    fill_in "Description", with: "The Cheat is Overwhelmed!"
    click_button "Create Task list"

    expect(page).to have_content("error")
    expect(TaskList.count).to eq(0)

    visit "/task_lists"
    expect(page).to_not have_content("The Cheat is Overwhelmed!")
  end

end
