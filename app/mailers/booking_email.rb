class BookingEmail < ApplicationMailer
	def booking_notice_email(user,listing,guest)
		@user = user
		@listing = listing
		@guest = guest
		mail(to: @user.email, subject: "Your #{@listing.name} have a reservation")
	end
end
