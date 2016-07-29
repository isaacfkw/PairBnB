class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :listing_tags, dependent: :destroy
	has_many :tags, through: :listing_tags
	has_many :reservations

	mount_uploaders :images, ImageUploader

	def taken_dates
		@taken_dates = []
		self.reservations.each do |x|
			x.reserved_dates.each do |y|
				@taken_dates << y
			end
		end
		return @taken_dates
	end

end