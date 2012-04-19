class Event < ActiveRecord::Base
  attr_accessible :enddate, :eventtype, :location, :name, :startdate
end
