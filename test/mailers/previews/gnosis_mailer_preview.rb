# Preview all emails at http://localhost:3000/rails/mailers/gnosis_mailer
class GnosisMailerPreview < ActionMailer::Preview
	def welcome_mail_preview
	   GnosisMailer.welcome_email(Usuario.first)
	 end
end
