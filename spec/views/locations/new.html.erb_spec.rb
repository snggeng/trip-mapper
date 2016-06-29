require 'rails_helper'

RSpec.describe "locations/new", :type => :view do
  before(:each) do
    assign(:location, Location.new(
      :latitude => 1.5,
      :longitude => 1.5,
      :address => "MyString",
      :activity => "MyText"
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input#location_latitude[name=?]", "location[latitude]"

      assert_select "input#location_longitude[name=?]", "location[longitude]"

      assert_select "input#location_address[name=?]", "location[address]"

      assert_select "textarea#location_activity[name=?]", "location[activity]"
    end
  end
end
