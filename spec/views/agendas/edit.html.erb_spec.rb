require 'rails_helper'

RSpec.describe "agendas/edit", type: :view do
  before(:each) do
    @agenda = assign(:agenda, Agenda.create!(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit agenda form" do
    render

    assert_select "form[action=?][method=?]", agenda_path(@agenda), "post" do

      assert_select "input#agenda_title[name=?]", "agenda[title]"

      assert_select "textarea#agenda_description[name=?]", "agenda[description]"
    end
  end
end
