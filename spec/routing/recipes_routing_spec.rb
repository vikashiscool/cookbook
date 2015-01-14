require "rails_helper"

RSpec.describe RecipesController, type: :routing do 
	it 'routes to #new' do
		expect(get('/recipes/new')).to route_to('recipes#new')
	end
end

