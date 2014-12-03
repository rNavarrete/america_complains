class Business < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :complaints
end
