require 'rails_helper'

describe "Creating task lists" do

  it "successfully redirects to the task list index page" do
    visit "/task_lists"
    click_link "New Task list"
    expect(page).to have_content("New Task List")
  # end

  # it "requires a title, but no description" do
  #   visit "/task_lists"
  #   click_link "New Task list"
    fill_in "Title", with: "Food to make my belly happy list"
    fill_in "Description", with: "Buy some pizza for my belly!"
    click_button "Create Task list"
    expect(page).to have_content("Food to make my belly happy list")
  end

end
