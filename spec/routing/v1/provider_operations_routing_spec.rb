# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::ProviderOperationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/provider_operations').to route_to('v1/provider_operations#index')
    end

    it 'routes to #new' do
      expect(get: '/v1/provider_operations/new').to route_to('v1/provider_operations#new')
    end

    it 'routes to #show' do
      expect(get: '/v1/provider_operations/1').to route_to('v1/provider_operations#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/v1/provider_operations/1/edit').to route_to('v1/provider_operations#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/v1/provider_operations').to route_to('v1/provider_operations#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/v1/provider_operations/1').to route_to('v1/provider_operations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/v1/provider_operations/1').to route_to('v1/provider_operations#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/v1/provider_operations/1').to route_to('v1/provider_operations#destroy', id: '1')
    end
  end
end
