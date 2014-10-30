class Category < ActiveRecord::Base

  has_many :event_categoryship
  has_many :events, :through => :event_categoryship

end
