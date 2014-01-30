require 'spec_helper'

describe "tarots/new" do
  before(:each) do
    assign(:tarot, stub_model(Tarot,
      :name => "MyString",
      :author => "MyString",
      :pw => "MyString"
    ).as_new_record)
  end

  it "renders new tarot form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tarots_path, "post" do
      assert_select "input#tarot_name[name=?]", "tarot[name]"
      assert_select "input#tarot_author[name=?]", "tarot[author]"
      assert_select "input#tarot_pw[name=?]", "tarot[pw]"
    end
  end
end
