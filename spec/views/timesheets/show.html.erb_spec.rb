require 'rails_helper'

RSpec.describe "timesheets/show", type: :view do
  before(:each) do
    @timesheet = assign(:timesheet, Timesheet.create!(
      hours: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
  end
end
