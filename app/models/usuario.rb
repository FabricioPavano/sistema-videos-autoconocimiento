class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         :confirmable


  has_one :schedule

  before_create :generate_schedule
  after_create :send_welcome_email


  def send_welcome_email
    GnosisMailer.welcome_email(self.email).deliver
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

    GnosisMailer.leccion_habilitada_email(self.email, 2).deliver_at( DateTime.now + (interval * 1) )
    GnosisMailer.leccion_habilitada_email(self.email, 3).deliver_at( DateTime.now + (interval * 2) )
    GnosisMailer.leccion_habilitada_email(self.email, 4).deliver_at( DateTime.now + (interval * 3) )

  end

  def set_default_password
    password = '123123'
    password_confirmation = '123123'
  end


  attr_accessor :remember_me
end
