class Patent < ActiveRecord::Base
  # Many to many relation with User
  has_many :user_patents
  has_many :users, through: :user_patents

  validates :number, presence: true, uniqueness: true, 
    format: { with: /[a-zA-Z]{3}\d{3}/ }
end
