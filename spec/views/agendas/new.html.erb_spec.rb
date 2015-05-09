require 'rails_helper'

RSpec.describe "agendas/new", type: :view do
  before(:each) do
    assign(:agenda, Agenda.new(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new agenda form" do
    render

    assert_select "form[action=?][method=?]", agendas_path, "post" do

      assert_select "input#agenda_title[name=?]", "agenda[title]"

      assert_select "textarea#agenda_description[name=?]", "agenda[description]"
    end
  end
end
