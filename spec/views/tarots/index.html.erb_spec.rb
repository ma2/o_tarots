require 'spec_helper'

describe "tarots/index" do
  before(:each) do
    assign(:tarots, [
      stub_model(Tarot,
        :name => "Name",
        :author => "Author",
        :pw => "Pw"
      ),
      stub_model(Tarot,
        :name => "Name",
        :author => "Author",
        :pw => "Pw"
      )
    ])
  end

  it "renders a list of tarots" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Pw".to_s, :count => 2
  end
end
