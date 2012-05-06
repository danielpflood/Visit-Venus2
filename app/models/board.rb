class Board < ActiveRecord::Base
  attr_accessible :title
  has_many :conversations
end