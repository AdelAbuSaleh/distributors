# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::RequestsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/requests').to route_to('v1/requests#index')
    end

    it 'routes to #new' do
      expect(get: '/v1/requests/new').to route_to('v1/requests#new')
    end

    it 'routes to #show' do
      expect(get: '/v1/requests/1').to route_to('v1/requests#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/v1/requests/1/edit').to route_to('v1/requests#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/v1/requests').to route_to('v1/requests#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/v1/requests/1').to route_to('v1/requests#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/v1/requests/1').to route_to('v1/requests#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/v1/requests/1').to route_to('v1/requests#destroy', id: '1')
    end
  end
end
