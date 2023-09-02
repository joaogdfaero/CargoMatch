require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "renders the index template of users" do
      get "/users"
      expect(response).to be_successful
    end
  end
end
