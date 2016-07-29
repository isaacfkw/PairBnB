class ReservationNotice < ApplicationMailer

	def confirmation_email(user)
		@user = user
		mail(to: @user.email, subject: 'Your Reservation Is Confirmed')
	end

end
