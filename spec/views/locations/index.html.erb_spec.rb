require 'rails_helper'

RSpec.describe "locations/index", :type => :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :latitude => 1.5,
        :longitude => 1.5,
        :address => "Address",
        :activity => "MyText"
      ),
      Location.create!(
        :latitude => 1.5,
        :longitude => 1.5,
        :address => "Address",
        :activity => "MyText"
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
