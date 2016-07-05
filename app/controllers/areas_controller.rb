class AreasController < ApplicationController
  before_action :authenticate_user!, except: [:generate]
  
  def index
    @areas = Area.all
  end

  def generate
  	area = Area.create(name: '47 entre 7 y 8')
  	generate_spots(area)
  	area = Area.create(name: '8 entre 47 y 46')
  	generate_spots(area)
  	area = Area.create(name: '46 entre 7 y 8')
  	generate_spots(area)
  	area = Area.create(name: '7 entre 47 y 46')
  	generate_spots(area)

  	redirect_to root_path
  end

  private

  def generate_spots(area)
  	[1,2,3,4,5].each do |number|
  		Spot.create(area_id: area.id, number: number)
  	end
  end

end
