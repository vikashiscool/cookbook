require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do
	describe '#new' do
		before { get :new } #run before each of the "it" methods

		it 'returns 200' do
			expect(response).to be_success
		end

		it 'renders recipes/new' do
			expect(response).to render_template 'recipes/new'
		end

		it 'assigns @recipe' do
			# assigns(:recipe) evaluates to @recipe
			expect(assigns(:recipe)).to be_a Recipe
			expect(assigns(:recipe)).not_to be_persisted #persisted method determines whether it exists in database
		end
	end

	describe '#create' do
		context 'valid params' do
			before do
				#You can pass in params to post
				post :create, recipe: {
					title: 'foo', instructions: 'bar'
				}
				end

			it 'assigns @recipe' do
				expect(assigns(:recipe)).to be_a Recipe
			end

			it 'persists to the recipe' do
				expect(assigns(:recipe)).to be_persisted
				# persisted -- successfully stored in DB
			end

			it 'redirects to the recipe' do
				expect(response).to redirect_to root_path #
			end
 		end

		context 'invalid params' do
			before do
				post :create, recipe: {
					title: '', instructions: ''
				}
			end

			it 'assigns @recipe' do
				expect(assigns(:recipe)).not_to be_persisted
			end

			it 'renders recipes/new' do
				expect(response).to render_template 'recipes/new'
			end
		end
	end

	describe '#show' do
		let!(:recipe) {FactoryGirl.create(:recipe) }
		#let makes a variable (recipe) available to your 'it methods'. the bang (!) makes it available immediately, before the tests are even run. Allows it to be available to all tests
		before { get :show, id: recipe.id }

		it 'returns 200' do
			expect(response).to be_success
		end

		it 'assigns @recipe' do
			# assigns(:recipe) evaluates to @recipe
			expect(assigns(:recipe)).to be_a Recipe
			expect(assigns(:recipe)).not_to be_persisted #persisted method determines whether it exists in database
		end

		it 'renders recipes/show' do
			expect(response).to render_template 'recipes/show'
		end
	end

	describe '#index' do
		before { get :index }
		end

		before(:context) do
			FactoryGirl.create(:recipe)
		end

		it 'returns 200' do
		 expect(response).to be_succeess
		end

		it 'renders recipes/index' do
			expect(resposne).to render_template
		end

		it 'assigns @recipes' do
			expect(assigns(:recipes)).to be_present
		end
	end
end
