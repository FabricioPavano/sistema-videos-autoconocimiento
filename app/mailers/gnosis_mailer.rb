class GnosisMailer < ApplicationMailer

	default from: "gnosisargentina1@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenido!')
  end

end
