require 'rails_helper'

RSpec.describe "Admins::Choices", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/admins/choices/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/admins/choices/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
