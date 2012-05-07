namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Event].each(&:delete_all)
    Event.populate 1..50 do |event|
      event.location = Populator.words(1..3).titleize
      event.name = Populator.words(1..2).titleize
      event.eventtype = Populator.words(1).titleize
      event.startdate = Time.at(rand * Time.now.to_i)
      event.enddate = Time.at(rand * Time.now.to_i)
    end
    Event.populate 1..10 do |event|
      event.location = "1232 Madeup St"
      event.name = Populator.words(1..2).titleize
      event.eventtype = Populator.words(1).titleize
      event.startdate = Time.at(rand * Time.now.to_i)
      event.enddate = Time.at(rand * Time.now.to_i)
    end
    Event.populate 1..10 do |event|
      event.location = Populator.words(1..3).titleize
      event.name = Populator.words(1..2).titleize
      event.eventtype = Populator.words(1).titleize
      event.startdate = "2012-12-10 01:25:58"
      event.enddate = Time.at(rand * Time.now.to_i)
    end
  end
end