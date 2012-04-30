class ConversationsController < ApplicationController
  before_filter :load_forum
  
  # GET /conversations
  # GET /conversations.xml
  def index
    @conversations = Conversation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @conversations }
    end
  end

  # CODE REMOVED FOR CLARITY SAKE
  
  private
  
  def load_forum
    if Forum.exists?(params[:forum_id])
      @forum = Forum.find(params[:forum_id]);
    end
              
    unless @forum
      redirect_to(forums_path, :notice =>"Please specify a valid forum")
    end
  end
end