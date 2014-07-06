class Roster < ActiveRecord::Base

  belongs_to :director
  has_many :auditionees

end
