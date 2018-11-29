class Comedian < ActiveRecord::Base
  validates :name, presence: true
  validates :age, presence: true
  validates :city, presence: true
end
