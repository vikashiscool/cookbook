require "rails_helper"

RSpec.describe RecipesController, type: :routing do 
	
	it 'routes to #new' do
		expect(get('/recipes/new')).to route_to('recipes#new')
	
	it 'routes to #create' do
		expect(get('recipes')).to route_to('recipes#create')
	end

	it 'routes to #show' do
		expect(get('/recipes/1')).to route_to('recipes#show', id: '1')
	end

	it 'routes to #index' do
		expect(get('/recipes')).to route_to('recipes#index')
	end
end

