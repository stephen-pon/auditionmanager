class Preference < ActiveRecord::Base

  has_many :auditionees
  belongs_to :director

end
