class GnosisMailer < ApplicationMailer

	include Resque::Mailer

	default from: "gnosisargentina1@gmail.com"

  def welcome_email(email)
    @user = email
    mail(to: email, subject: 'Bienvenido!')
  end

  def leccion_habilitada_email(email, numero_leccion)
    @email = email
    @numero_leccion = numero_leccion

    subject = "La lección nro #{numero_leccion} ya se encuentra habilitada!"
    mail(to: @email, subject: subject)
  end

end
