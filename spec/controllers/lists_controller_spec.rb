require 'rails_helper'
  RSpec.describe ListsController, :type => :controller do
  	context 'Controller tests' do
	  	describe 'Get index ' do
	  		it 'render the  index template' do
	  			list = create(:list)
	  			get :index
			    expect(response).to have_http_status(:ok)
			    expect(response).to render_template :index
			    expect(assigns(:lists)).to eq([list])
	  		end
	  	end

	  	describe 'Get edit' do
	  		it 'render the edit template' do
	  			list = create(:list)
	  			get  :edit, params: {id: list.id}
	  			expect(response).to have_http_status(:ok)
	  			expect(response).to render_template :edit
	  			expect(assigns(:list)).to eq(list)
	  		end
	  	end

	  	describe 'Get show template' do
	  		it 'render the show template' do 
	  			list = create(:list)
	  			get :show, params: {id: list.id}
	  			expect(response).to have_http_status(:ok)
	  			expect(response).to render_template :show
	  			expect(assigns(:list)).to eq(list)
	  		end
	  	end

		describe 'GET #new' do
			it 'render new template' do 
		    	get :new
		    	expect(response).to have_http_status(:ok)
		    	expect(response).to render_template :new
		      	expect(assigns(:list)).to be_a_new(List)
		    end
		end

		describe ' Delete' do 
	    	before :each do 
	      		@list = create(:list)
	    	end
	    	it 'list destroyed' do 
	      		expect {delete :destroy, params: {id: @list}}.to change(List, :count).by (-1)
	      		expect(response).to redirect_to (lists_url)
	    	end
	  	end

	  	describe 'PUT update' do 
		    before :each do 
		      @list = create(:list)
		    end
		    it 'updating' do 
		      put :update, params: {id: @list, list:FactoryBot.attributes_for(:list)}
		      assigns(:list).should eq(@list)
		    end
		    it 'updating should be:' do 
		      put :update, params: {id: @list, list:FactoryBot.attributes_for(:list, task:'tarea1')}
		      @list.reload
		      @list.task.should eq('tarea1')

		    end
		    it 'updated should redirect_to' do 
		      put :update, params: {id: @list, list: FactoryBot.attributes_for(:list)}
		      expect(response).to redirect_to (root_url)
		    end
	  	end
	end
end
  