class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :confirmable


  has_one :schedule

  before_create :generate_schedule, :send_welcome_email

  def send_welcome_email
    # GnosisMailer.welcome_email(self.email).deliver
  end

  def after_confirmation
    Resque.enqueue_in(1.second, SendTemplateEmailJob, {
      email: self.email,
      numero_leccion: 1
    })
  end

  def generate_schedule
  	interval = 1
    set_default_password
  	build_schedule
  	schedule.leccion1 = DateTime.now
  	schedule.leccion2 = DateTime.now + (interval * 1)
  	schedule.leccion3 = DateTime.now + (interval * 2)
  	schedule.leccion4 = DateTime.now + (interval * 3)
  	schedule.leccion5 = DateTime.now + (interval * 4)

    # GnosisMailer.leccion_habilitada_email(self.email, 2).deliver_at(  )
    # GnosisMailer.leccion_habilitada_email(self.email, 3).deliver_at( DateTime.now + (interval * 2) )
    # GnosisMailer.leccion_habilitada_email(self.email, 4).deliver_at( DateTime.now + (interval * 3) )

   

    Resque.enqueue_in(1.days, SendTemplateEmailJob, {
      email: self.email,
      numero_leccion: 2
    })

    Resque.enqueue_in(2.days, SendTemplateEmailJob, {
      email: self.email,
      numero_leccion: 3
    })

    Resque.enqueue_in(3.days, SendTemplateEmailJob, {
      email: self.email,
      numero_leccion: 4
    })

     Resque.enqueue_in(4.days, SendTemplateEmailJob, {
      email: self.email,
      numero_leccion: 5
    })
  end

  def set_default_password
    password = '123123'
    password_confirmation = '123123'
  end


  attr_accessor :remember_me
end
