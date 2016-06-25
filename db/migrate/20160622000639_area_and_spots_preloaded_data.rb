class AreaAndSpotsPreloadedData < ActiveRecord::Migration
  area = Area.create(name: 'La Plata Norte')
  6.times do |number|
    area.spots.create(number: number+1)
  end
end
