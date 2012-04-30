class Conversation < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :comments
    belongs_to :user
    belongs_to :forum
    validates_presence_of :title
end