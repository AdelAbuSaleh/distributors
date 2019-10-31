require 'rails_helper'

RSpec.describe "V1::Providers", type: :request do
  describe "GET /v1/providers" do
    it "works! (now write some real specs)" do
      get v1_providers_path
      expect(response).to have_http_status(200)
    end
  end
end
