require 'rails_helper'

RSpec.describe "agendas/index", type: :view do
  before(:each) do
    assign(:agendas, [
      Agenda.create!(
        :title => "Title",
        :description => "MyText"
      ),
      Agenda.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of agendas" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
