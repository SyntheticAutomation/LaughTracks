class Comedian < ActiveRecord::Base
  has_many :specials
  validates :name, presence: true
  validates :age, presence: true
  validates :city, presence: true

  def self.average_age
    average(:age)
  end
end
