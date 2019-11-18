class Success < ApplicationRecord
  belongs_to :achievement, polymorphic: true
  belongs_to :user
end
