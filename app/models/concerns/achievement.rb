module Achievement
  extend ActiveSupport::Concern

  included do
    has_many :success, as: :achievement
  end
end
