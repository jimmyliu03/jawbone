require 'spec_helper'

describe StaticPagesController do

  describe "GET 'connect'" do
    it "returns http success" do
      get 'connect'
      response.should be_success
    end
  end

end
