class Partner < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :deals
  has_many :challenges, through: :deals
end
