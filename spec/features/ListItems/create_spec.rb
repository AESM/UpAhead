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

end
