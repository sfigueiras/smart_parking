class AddAddressAndNameToUser < ActiveRecord::Migration
  change_table :users do |t|
    t.string :name
    t.string :address
  end
end
