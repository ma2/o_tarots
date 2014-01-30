require 'spec_helper'

describe "cards/edit" do
  before(:each) do
    @card = assign(:card, stub_model(Card,
      :number => 1,
      :name => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", card_path(@card), "post" do
      assert_select "input#card_number[name=?]", "card[number]"
      assert_select "input#card_name[name=?]", "card[name]"
      assert_select "input#card_text[name=?]", "card[text]"
    end
  end
end
