require 'rails_helper'

RSpec.describe "Trips", type: :request do
  describe "GET /index" do
    it "renders the index template of trips" do
      get "/trips"
      expect(response).to be_successful
    end
  end
end

