require 'rails_helper'

describe "Creating task lists" do

  it "Successfully redirects to the task list index page" do
    visit "/task_lists"
    click_link "New Task list"
    expect(page).to have_content("New Task List")

    fill_in "Title", with: "Food to make my belly happy list"
    fill_in "Description", with: "Buy some pizza for my belly!"
    click_button "Create Task list"

    expect(page).to have_content("Food to make my belly happy list")
  end

end
