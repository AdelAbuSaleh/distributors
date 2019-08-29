# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CallCenters', type: :request do
  describe 'GET /call_centers' do
    it 'works! (now write some real specs)' do
      get call_centers_path
      expect(response).to have_http_status(200)
    end
  end
end
