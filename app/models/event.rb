class Event < ActiveRecord::Base
  attr_accessible :enddate, :eventtype, :location, :name, :startdate
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  
end
