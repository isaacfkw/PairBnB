class ListingsController < ApplicationController
before_action :this_listing, only: [:edit, :show, :update, :destroy]
before_action :require_login, only: [:edit, :new, :update, :destroy]

	def index
		byebug
		@listing = Listing.page(params[:page]).per_page(5)
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save

			#do the logic to save tags as well
			#process taglist
			#params[:listing][:tags] -> string
			# .split(',')
			# .select{|x| x!= " "}
			# .uniq
			# @list_of_tags
			
			# @listing.tags << @list_f
			# save_tag
			redirect_to listing_path(@listing)
		else
			render :new
		end
	end

	def show
		# @tag = Listing.find(params[:id]).tags
		# byebug
		@reservation = Reservation.new
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
	def listing_params #whitelist of parameters that can enter ur database
		params.require(:listing).permit(:name, :description, :number_of_guest, :price, {images:[]})
	end

	def this_listing
		@listing = Listing.find(params[:id])
	end

	# def save_tag
	# 	@taglist = []
	# 	@taglist = params[:listing][:tags]
	# 	@listing.tags << Tag.find_or_create_by(property_type: @taglist["property_type"])

	# end
end

