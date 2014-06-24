require 'spec_helper'

describe WorldController do

  describe "GET 'shuffle,'" do
    it "returns http success" do
      get 'shuffle,'
      expect(response).to be_success
    end
  end

  describe "GET 'draw'" do
    it "returns http success" do
      get 'draw'
      expect(response).to be_success
    end
  end

end
