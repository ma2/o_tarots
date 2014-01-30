require 'spec_helper'

describe "tarots/edit" do
  before(:each) do
    @tarot = assign(:tarot, stub_model(Tarot,
      :name => "MyString",
      :author => "MyString",
      :pw => "MyString"
    ))
  end

  it "renders the edit tarot form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tarot_path(@tarot), "post" do
      assert_select "input#tarot_name[name=?]", "tarot[name]"
      assert_select "input#tarot_author[name=?]", "tarot[author]"
      assert_select "input#tarot_pw[name=?]", "tarot[pw]"
    end
  end
end
