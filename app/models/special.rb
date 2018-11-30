class Special < ActiveRecord::Base

  belongs_to :comedian

  validates :title, presence: true
  validates :runtime, presence: true
  validates :image, presence: true

  def self.average_runtime
    average(:runtime).round
  end
end
