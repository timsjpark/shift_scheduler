require 'rails_helper'

RSpec.describe "shifts/edit", type: :view do
  before(:each) do
    @shift = assign(:shift, Shift.create!(
      :shift_description => "MyString",
      :schedule => nil
    ))
  end

  it "renders the edit shift form" do
    render

    assert_select "form[action=?][method=?]", shift_path(@shift), "post" do

      assert_select "input#shift_shift_description[name=?]", "shift[shift_description]"

      assert_select "input#shift_schedule_id[name=?]", "shift[schedule_id]"
    end
  end
end
