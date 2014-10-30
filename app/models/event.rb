class Event < ActiveRecord::Base

  validates_presence_of :name
  has_many :attendees, dependent: :destroy

  belongs_to :user

  has_many :event_categoryship
  has_many :categories, :through => :event_categoryship

  has_many :comments

end
