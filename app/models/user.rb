class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable, :rememberable
  validates :name, :address, presence: true

  # Many to many relation with Patent
  has_many :user_patents
  has_many :patents, through: :user_patents

  has_many :reservations
  has_many :spots, through: :reservations

  def selected_patent
    self.user_patents.where(selected: true).first
  end

  def not_selected_patents
    self.user_patents.where(selected: false)
  end

  def select_patent(patent_id = nil)
    # Delete selected from the other patent
    if !patent_id.nil?
      current_selected = user_patents.where(selected: true).first
      current_selected.update_attribute(:selected, false) if !!current_selected

      # Update new patent
      patent = user_patents.where(patent_id: patent_id).first
    else
      patent = user_patents.first
    end
    patent.update_attribute(:selected, true)
  end

  def has_reservation?
    reservations.size > 0
  end

  def has_reserved(spot)
    reservations.where(spot_id: spot.id).size == 1
  end
end
