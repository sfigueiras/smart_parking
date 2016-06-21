class UserPatent < ActiveRecord::Base
  belongs_to :user
  belongs_to :patent
  accepts_nested_attributes_for :patent, allow_destroy: true
end
