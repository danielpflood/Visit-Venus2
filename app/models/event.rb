class Event < ActiveRecord::Base
  attr_accessible :enddate, :eventtype, :location, :name, :startdate
  
  def self.search(searchparam)
    if !searchparam[:name].nil? || !searchparam[:type].nil? || !searchparam[:location].nil? || !searchparam[:date].nil?
      where("name LIKE ? AND eventtype like ? AND location like ? AND (startdate like ? OR enddate like ?)" , "%#{searchparam[:name]}%", "%#{searchparam[:type]}%", "%#{searchparam[:location]}%", "%#{searchparam[:date]}%", "%#{searchparam[:date]}%")
    else
      scoped
    end
  end

  
end
  