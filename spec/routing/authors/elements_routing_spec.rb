require 'rails_helper'

RSpec.describe Authors::ElementsController, :type => :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/posts/elements').not_to route_to('authors/elements#index')
    end

    it 'routes to #new' do
      expect(:get => '/posts/elements/new').not_to route_to('authors/elements#new')
    end

    it 'routes to #show' do
      expect(:get => '/posts/elements/1').not_to route_to('authors/elements#show', :id => '1')
    end

    it 'routes to #edit' do
      expect(:get => '/posts/elements/1/edit').not_to route_to('authors/elements#edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/posts/1/elements').to route_to(:controller => 'authors/elements', :action => 'create', :post_id => '1')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/posts/1/elements/1').to route_to(:controller => 'authors/elements', :action => 'update', :id => '1', :post_id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/posts/1/elements/1').to route_to(:controller => 'authors/elements', :action => 'update', :id => '1', :post_id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/posts/1/elements/1').to route_to(:controller => 'authors/elements', :action => 'destroy', :id => '1', :post_id => '1')
    end
  end
end
