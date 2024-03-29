class ConversationsController < ApplicationController
  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @conversations }
    end
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    @conversation = Conversation.find(params[:id])
    load_board
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @conversation }
    end
  end

  # GET /conversations/new
  # GET /conversations/new.json
  def new
    @conversation = Conversation.new
    @comment = @conversation.comments.build
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /conversations/1/edit
  def edit
    @conversation = Conversation.find(params[:id])
  end

  # POST /conversations
  # POST /conversations.json
  def create
    load_board
    @conversation = Conversation.new(params[:conversation])
    @comment = @conversation.comments.build(params[:comment])
    @conversation.user_id  = @comment.user_id = session[:user_id]
    @conversation.board = @board

    respond_to do |format|
      if current_user && @conversation.save
        format.html { redirect_to(board_path(@board), :notice => 'Your Post was created') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /conversations/1
  # PUT /conversations/1.json
  def update
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      if @conversation.update_attributes(params[:conversation])
        format.html { redirect_to @conversation, :notice => 'Conversation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @conversation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    respond_to do |format|
      format.html { redirect_to conversations_url }
      format.json { head :no_content }
    end
  end
  
  def reply
    @conversation = Conversation.find(params[:id])
    load_board
    @comment = Comment.new
  end
  
  def save_reply
    logger.debug "in save reply******** params are:"
    logger.debug params
    @comment = Comment.create(params[:comment])
    respond_to do |format|
      if current_user && @comment.save
        format.html { redirect_to(boards_path, :notice => 'Your Reply was created') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  private

    def load_board
      if Board.exists?(params[:board_id])
        @board = Board.find(params[:board_id]);
      end

      unless @board
        redirect_to(boards_path, :notice =>"Please specify a valid board")
      end
    end
  
  
end
