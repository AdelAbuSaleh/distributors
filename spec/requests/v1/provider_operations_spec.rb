# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::ProviderOperations', type: :request do
  describe 'GET /v1/provider_operations' do
    it 'works! (now write some real specs)' do
      get v1_provider_operations_path
      expect(response).to have_http_status(200)
    end
  end
end
