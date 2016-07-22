class UsersController < ApplicationController
	def edit
	end

	def index
		@listing = Listing.all
		@listing_new = Listing.new
	end
	private

end
