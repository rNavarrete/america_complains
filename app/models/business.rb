class Business < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :complaints

  searchable do
    text :name
  end
end
