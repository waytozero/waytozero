class Deal < ApplicationRecord
  belongs_to :challenge
  belongs_to :partner
end
