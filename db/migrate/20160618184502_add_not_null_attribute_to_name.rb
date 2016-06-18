class AddNotNullAttributeToName < ActiveRecord::Migration
  change_column_null :users, :name, false
end
