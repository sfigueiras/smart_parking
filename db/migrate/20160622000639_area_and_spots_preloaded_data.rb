class AreaAndSpotsPreloadedData < ActiveRecord::Migration
  areas = ['La Plata Norte', 'La Plata Sur', 'La Plata Oeste', 
    'Berisso', 'Ensenada']
  areas.each do |name|
    say "Inserting ${area} area"
    area = Area.create(name: name)
    6.times do |number|
      area.spots.create(number: number+1)
    end
  end
end
