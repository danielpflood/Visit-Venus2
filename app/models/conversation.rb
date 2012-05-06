class Conversation < ActiveRecord::Base
  attr_accessible :board_id, :id, :title, :user_id
  has_many :comments
  belongs_to :user
  belongs_to :board
  validates_presence_of :title
  
  # GET /conversations/reply
  def reply
    @conversation = Conversation.find(params[:id])
    @comment = @conversation.comments.build
    
    respond_to do |format|
      format.html #reply.html.erb
    end
  end
  
  # POST /conversations/reply
  def save_reply
    if !current_user
      redirect_to(:login, :notice =>"Please login before posting")
      return 1;
    end
    
    if Conversation.exists?(params[:id])
      @conversation = Conversation.find(params[:id])
      @comment = @conversation.comments.build(params[:comment])
      @comment.user_id = current_user.id
    else
      redirect_to(boards_path, :notice =>"Please specify a valid board")
    end
        
    respond_to do |format|
      if current_user && @comment.save
        format.html { redirect_to(board_path(@board), :notice => 'Your reply was posted') }
      else
        format.html { render :action => "new" }
      end
    end
  end
end