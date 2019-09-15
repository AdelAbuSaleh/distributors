require 'rails_helper'

RSpec.describe "DistributorOperations", type: :request do
  describe "GET /distributor_operations" do
    it "works! (now write some real specs)" do
      get distributor_operations_path
      expect(response).to have_http_status(200)
    end
  end
end
