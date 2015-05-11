require 'rails_helper'

describe "Adding list items" do
  let!(:task_list) { TaskList.create(title: "Totally Batman", description: "Things required to be Batman.") }

  def visit_task_list(list)

    visit "/task_lists"
    within "#task_list_#{list.id}" do
      click_link "List Items"
    end

  end

  it "successfully created if the content is valid" do
    visit_task_list(task_list)
    click_link "New List Item"

    fill_in "Content", with: "cape"
    # fill_in "Content", with: "cowel"
    # fill_in "Content", with: "gauntlets"
    # fill_in "Content", with: "raspy voice"
    click_button "Save"

    expect(page).to have_content("New item added.")

    within("ul.list_items") do
      expect(page).to have_content("cape")
      # expect(page).to have_content("cowel")
      # expect(page).to have_content("gauntlets")
      # expect(page).to have_content("raspy voice")
    end

  end

  it "raises an error if no content is submitted" do
    visit_task_list(task_list)
    click_link "New List Item"

    fill_in "Content", with: ""
    click_button "Save"

    within("div.flash") do
      expect(page).to have_content("The item could not be added.  Sorry.")
    end

    expect(page).to have_content("Content can't be blank")
  end

  it "raises an error if there are less than three characters submitted as content" do
    visit_task_list(task_list)
    click_link "New List Item"

    fill_in "Content", with: "00"
    click_button "Save"

    within("div.flash") do
      expect(page).to have_content("The item could not be added.  Sorry.")
    end

    expect(page).to have_content("Content is too short")
  end

end
