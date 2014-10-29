class Event < ActiveRecord::Base
  validates_presence_of :name
  has_many :attendees, dependent: :destroy
  belongs_to :category
  belongs_to :user
end
