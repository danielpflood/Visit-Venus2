class Event < ActiveRecord::Base
  attr_accessible :enddate, :eventtype, :location, :name, :startdate
  
  def self.search(searchparam)
    if !searchparam[:name].nil? || !searchparam[:type].nil? || !searchparam[:location].nil?
      where("name LIKE ? AND eventtype like ? AND location like ?" , "%#{searchparam[:name]}%", "%#{searchparam[:type]}%", "%#{searchparam[:location]}%")
    else
      scoped
    end
  end

  
end
