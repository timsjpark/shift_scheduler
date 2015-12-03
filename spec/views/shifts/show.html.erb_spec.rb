require 'rails_helper'

RSpec.describe "shifts/show", type: :view do
  before(:each) do
    @shift = assign(:shift, Shift.create!(
      :shift_description => "Shift Description",
      :schedule => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Shift Description/)
    expect(rendered).to match(//)
  end
end
