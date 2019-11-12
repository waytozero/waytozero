class Success < ApplicationRecord
  belongs_to :achievement, polymorphic: true
end
