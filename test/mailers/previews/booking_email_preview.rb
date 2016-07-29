# Preview all emails at http://localhost:3000/rails/mailers/booking_email
class BookingEmailPreview < ActionMailer::Preview
	def booking_notice_email_preview
    BookingEmail.booking_notice_email(User.first, Listing.first, User.first)
  end
end
