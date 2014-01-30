require 'spec_helper'

describe "tarots/show" do
  before(:each) do
    @tarot = assign(:tarot, stub_model(Tarot,
      :name => "Name",
      :author => "Author",
      :pw => "Pw"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Pw/)
  end
end
