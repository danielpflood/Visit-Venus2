class Forum < ActiveRecord::Base
  attr_accessible :description, :title
  
  has_many :conversations 

    validates :title, :presence => true
    validates :description, :presence => true
end
