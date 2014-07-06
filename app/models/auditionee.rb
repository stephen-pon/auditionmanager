class Auditionee < ActiveRecord::Base

  belongs_to :casting_group
  belongs_to :roster
  belongs_to :preference
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates_format_of :phone_number, 
                      :with => /[0-9]{10}/,
                      :message => "Phone numbers must have no punctuation or spaces and have exactly 10 digits"

  searchable do
    text :phone_number, :first_name, :last_name, :email, :facebook_url
  end

end
