class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_one :schedule

  before_create :generate_schedule
  after_create :send_welcome_email


  def send_welcome_email
    GnosisMailer.welcome_email(self).deliver
  end

  def generate_schedule
  	interval = 3

  	build_schedule
  	schedule.leccion1 = DateTime.now
  	schedule.leccion2 = DateTime.now + (interval * 1)
  	schedule.leccion3 = DateTime.now + (interval * 2)
  	schedule.leccion4 = DateTime.now + (interval * 3)
  	schedule.leccion5 = DateTime.now + (interval * 4)
  end


  attr_accessor :remember_me
end
