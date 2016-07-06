class AreasController < ApplicationController
  before_action :authenticate_user!, except: [:generate]
  
  def index
    @areas = Area.all
  end

  def generate
  	area = Area.create(name: 'La Plata Norte')
  	generate_spots(area)
  	area = Area.create(name: 'La Plata Sur')
  	generate_spots(area)

  	redirect_to root_path
  end

  def interested_areas
    @area = Area.first
  end

  private

  def generate_spots(area)
  	[1,2,3,4,5].each do |number|
  		Spot.create(area_id: area.id, number: number)
  	end
  end

end
