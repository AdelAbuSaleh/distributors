# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DistributorOperationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/distributor_operations').to route_to('distributor_operations#index')
    end

    it 'routes to #new' do
      expect(get: '/distributor_operations/new').to route_to('distributor_operations#new')
    end

    it 'routes to #show' do
      expect(get: '/distributor_operations/1').to route_to('distributor_operations#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/distributor_operations/1/edit').to route_to('distributor_operations#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/distributor_operations').to route_to('distributor_operations#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/distributor_operations/1').to route_to('distributor_operations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/distributor_operations/1').to route_to('distributor_operations#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/distributor_operations/1').to route_to('distributor_operations#destroy', id: '1')
    end
  end
end
