class ListingsController < ApplicationController
before_action :this_listing, only: [:edit, :show, :update, :destroy]
before_action :require_login, only: [:edit, :new, :update, :destroy]

	def index
		@listing = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to listing_path(@listing)
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		@listing.update(listing_params)
		redirect_to listing_path(@listing)
	end

	def destroy	
		Listing.delete(params[:id])
		redirect_to listings_path
	end





	private
	def listing_params
		params.require(:listing).permit(:name, :description, :number_of_guest, :price,)
	end

	def this_listing
		@listing = Listing.find(params[:id])
	end

end

