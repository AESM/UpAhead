require 'rails_helper'

describe "Editing task lists" do
  let!(:task_list) { TaskList.create(title: "Party!", description: "The list of parties I must attend.") }

  def updateTaskList(options={})
    options[:title] ||= "A list of the things"
    options[:description] ||= "A description of said things"

    task_list = options[:task_list]

    visit "/task_lists"
    within "#task_list_#{task_list.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Update Task list"
  end

  it "successfully updates a task list" do

    updateTaskList task_list: task_list,
                   title: "Responsibility!",
                   description: "The list of responsible-person things I must do."

    task_list.reload

    expect(page).to have_content("Task list was successfully updated.")
    expect(task_list.title).to eq("Responsibility!")
    expect(task_list.description).to eq("The list of responsible-person things I must do.")
  end

  it "raises an error when no title is included" do
    updateTaskList task_list: task_list, title: ""
    zee_title = task_list.title

    task_list.reload

    expect(task_list.title).to eq(zee_title)
    expect(page).to have_content("error")
  end

  it "raises an error when the title is shorter than three characters" do
    updateTaskList task_list: task_list, title: "F"
    zee_title = task_list.title

    task_list.reload

    expect(task_list.title).to eq(zee_title)
    expect(page).to have_content("error")
  end

  it "raises an error when the title is longer than fifty characters" do
    updateTaskList task_list: task_list, title: "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
    zee_title = task_list.title

    task_list.reload

    expect(task_list.title).to eq(zee_title)
    expect(page).to have_content("error")
  end

  it "raises an error when no description is included" do
    updateTaskList task_list: task_list, description: ""
    zee_description = task_list.description

    task_list.reload

    expect(task_list.description).to eq(zee_description)
    expect(page).to have_content("error")
  end

end
