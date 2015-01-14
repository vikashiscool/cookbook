require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do
	describe '#new' do
		before { get:new } #run before each of the "it" methods

		it 'returns 200' do
			expect(response).to be_success
		end

		it 'renders recipes/new' do
			expect(response).to render_template 'recipes/new'
		end

		it 'assigns @recipe' do
			expect(assigns(:recipe)).to be_a Recipe
			expect(assigns(:recipe)).not_to be_persisted #persisted method determines whether it exists in database
		end
	end
end
