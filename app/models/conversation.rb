class Conversation < ActiveRecord::Base
  attr_accessible :board_id, :id, :title, :user_id
end
