require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/authors/"
      expect(response).to have_http_status(:success)
    end
  end

end
