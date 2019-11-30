class HomeController < ApplicationController
	def delete_crossed
		@delete_crossed = List.where(:status => true).destroy_all
		redirect_to root_url, notice: 'All crossed tasks were successfully destroyed'
	end

	def delete_all
		@delete_all = List.destroy_all
		redirect_to root_url, notice: 'All taks were successfully destroyed'
	end
end