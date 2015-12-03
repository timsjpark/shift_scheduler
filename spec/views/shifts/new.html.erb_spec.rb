require 'rails_helper'

RSpec.describe "shifts/new", type: :view do
  before(:each) do
    assign(:shift, Shift.new(
      :shift_description => "MyString",
      :schedule => nil
    ))
  end

  it "renders new shift form" do
    render

    assert_select "form[action=?][method=?]", shifts_path, "post" do

      assert_select "input#shift_shift_description[name=?]", "shift[shift_description]"

      assert_select "input#shift_schedule_id[name=?]", "shift[schedule_id]"
    end
  end
end
