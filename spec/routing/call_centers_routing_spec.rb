# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CallCentersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/call_centers').to route_to('call_centers#index')
    end

    it 'routes to #new' do
      expect(get: '/call_centers/new').to route_to('call_centers#new')
    end

    it 'routes to #show' do
      expect(get: '/call_centers/1').to route_to('call_centers#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/call_centers/1/edit').to route_to('call_centers#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/call_centers').to route_to('call_centers#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/call_centers/1').to route_to('call_centers#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/call_centers/1').to route_to('call_centers#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/call_centers/1').to route_to('call_centers#destroy', id: '1')
    end
  end
end
