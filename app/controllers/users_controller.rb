class UsersController < ApplicationController
	def edit
	end

	def index
		@listing = Listing.page(params[:page]).per_page(5)
		@listing_new = Listing.new
	end
	private

end
