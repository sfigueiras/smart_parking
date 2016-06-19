class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable, :rememberable
  validates :name, :address, presence: true

  # Many to many relation with Patent
  has_and_belongs_to_many :patents
end
