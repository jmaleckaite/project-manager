require 'rails_helper'

RSpec.describe "timesheets/index", type: :view do
  before(:each) do
    assign(:timesheets, [
      Timesheet.create!(
        hours: 2.5
      ),
      Timesheet.create!(
        hours: 2.5
      )
    ])
  end

  it "renders a list of timesheets" do
    render
    assert_select "tr>td", text: 2.5.to_s, count: 2
  end
end
