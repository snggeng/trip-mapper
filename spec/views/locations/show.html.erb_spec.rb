require 'rails_helper'

RSpec.describe "locations/show", :type => :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :latitude => 1.5,
      :longitude => 1.5,
      :address => "Address",
      :activity => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/MyText/)
  end
end
