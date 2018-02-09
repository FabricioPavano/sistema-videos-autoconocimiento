require 'open-uri'
require 'net/http'

class SendTemplateEmailJob
  @queue = :mailer

  # Mapea numero de leccion con el id de la plantilla en SendInblue
 


  def self.mandar_email(email_destino, numero_leccion)


  	puts 'Argumentos 2'
  	puts email_destino
  	puts numero_leccion

  	diccionario_lecciones = {
	    1 => 3,
	    2 => 4,
	    3 => 5,
	    4 => 6,
	    5 => 7
	  }


    numero_plantilla = diccionario_lecciones[numero_leccion]

    url = URI("https://api.sendinblue.com/v3/smtp/templates/#{numero_plantilla}/send")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(url)


    puts "https://api.sendinblue.com/v3/smtp/templates/#{numero_plantilla}/send"

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

  def self.perform(args)

  	puts 'Argumentos 1'
  	puts args

  	mandar_email(args["email"], args["numero_leccion"])
  end


end
