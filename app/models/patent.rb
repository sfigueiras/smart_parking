class Patent < ActiveRecord::Base
  # Many to many relation with User
  has_and_belongs_to_many :users

  validates :number, presence: true, uniqueness: true, 
    format: { with: /[a-zA-Z]{3}\d{3}/ }
end
