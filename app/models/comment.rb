class Comment < ActiveRecord::Base
  attr_accessible :body, :conversation_id, :id, :user_id
end
