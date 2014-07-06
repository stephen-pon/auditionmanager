class Director < ActiveRecord::Base

  validates :password, :presence => true

  has_one :preference
  has_one :roster

  def self.authenticate(username, pass)
    director = find_by_name(username)
    if director && director.password == pass
      director
    else
      nil
    end
  end

end
