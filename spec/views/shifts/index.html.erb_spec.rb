require 'rails_helper'

RSpec.describe "shifts/index", type: :view do
  before(:each) do
    assign(:shifts, [
      Shift.create!(
        :shift_description => "Shift Description",
        :schedule => nil
      ),
      Shift.create!(
        :shift_description => "Shift Description",
        :schedule => nil
      )
    ])
  end

  it "renders a list of shifts" do
    render
    assert_select "tr>td", :text => "Shift Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
