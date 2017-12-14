class Schedule < ApplicationRecord
  belongs_to :usuario

  validates :leccion1, presence: true
  validates :leccion2, presence: true
  validates :leccion3, presence: true
  validates :leccion4, presence: true
  validates :leccion5, presence: true

end
