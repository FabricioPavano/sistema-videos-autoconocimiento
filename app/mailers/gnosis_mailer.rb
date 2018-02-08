require 'open-uri'

class GnosisMailer < ApplicationMailer

	include Resque::Mailer

  # Mapea numero de leccion con el id de la plantilla en SendInblue
  diccionario_lecciones = {
    1 => 3,
    2 => 4,
    3 => 5,
    4 => 6,
    5 => 7
  }

	default from: "gnosisargentina1@gmail.com"

  def welcome_email(email)
    @user = email
  end

  def leccion_habilitada_email(email, numero_leccion)
    mandar_email(email, numero_leccion)
  end

  def mandar_email(email_destino, numero_leccion)

    numero_plantilla = diccionario_lecciones[numero_leccion]

    url = URI("https://api.sendinblue.com/v3/smtp/templates/#{numero_plantilla}/send")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(url)

    # HEADERS
    req['content-type'] = 'application/json'
    req['api-key'] = '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'

    # PARAMS
    params = { 'emailTo' => [email_destino]  }
    req.body = params.to_json

    # Send!
    response = http.request(req)
    puts response.read_body
  end

end
