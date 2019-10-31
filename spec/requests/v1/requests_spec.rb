require 'rails_helper'

RSpec.describe "V1::Requests", type: :request do
  describe "GET /v1/requests" do
    it "works! (now write some real specs)" do
      get v1_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
