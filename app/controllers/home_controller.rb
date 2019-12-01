class HomeController < ApplicationController

	def delete_all
	    @delete_all = List.destroy_all
	    respond_to do |format|
	      format.html { redirect_to lists_url, notice: 'all tasks was successfully destroyed.' }
	      format.json { head :no_content }
	    end  
  	end
  	def delete_crossed
		@delete_crossed = List.where(:status => true).destroy_all
		redirect_to root_url, notice: 'All crossed tasks were successfully destroyed' 
	end

end