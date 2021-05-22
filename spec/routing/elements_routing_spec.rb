require 'rails_helper'

RSpec.describe ElementsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/elements').to route_to('elements#index')
    end

    it 'routes to #new' do
      expect(get: '/elements/new').to route_to('elements#new')
    end

    it 'routes to #show' do
      expect(get: '/elements/1').to route_to('elements#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/elements/1/edit').to route_to('elements#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/elements').to route_to('elements#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/elements/1').to route_to('elements#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/elements/1').to route_to('elements#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/elements/1').to route_to('elements#destroy', id: '1')
    end
  end
end
