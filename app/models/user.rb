class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable, :rememberable
  validates :name, :address, presence: true

  # Many to many relation with Patent
  has_many :user_patents
  has_many :patents, through: :user_patents
  has_many :payments


  has_many :reservations
  has_many :spots, through: :reservations

  def selected_patent
    self.user_patents.where(selected: true).first
  end

  def not_selected_patents
    self.user_patents.where(selected: false)
  end

  def select_patent(patent_id = nil)
    logger.debug "ENTRO EN SELECT_PATENT"
    # Delete selected from the other patent
    current_selected = user_patents.where(selected: true).first
    current_selected.update(selected: false) if !!current_selected
    if !patent_id.nil?
    
      # Update new patent
      patent = user_patents.where(patent_id: patent_id).first
    else
      patent = user_patents.first
    end
    patent.update(selected: true)
  end

  def has_reservation?
    reservations.size > 0
  end

  #Checks if user has a reservation active with the selected patent
  def has_reservation_with_patent?(patent)
    reservations.where(patent_id: patent.id, ends_at: nil).size > 0
  end

  def has_reserved(spot)
    reservations.where(spot_id: spot.id, ends_at: nil).size > 0
  end

end
