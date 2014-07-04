class CastingGroup < ActiveRecord::Base

  has_many :auditionees

  serialize :group_order, Array

end
