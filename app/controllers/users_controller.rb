class UsersController < ApplicationController
  
  def new
    @user = User.new
    @title = "Sign Up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end 
  
  def show
    @user = User.find(params[:id])
  end
    
    private

      def is_user
        if User.exists?(params[:id])
          @user = User.find(params[:id]);
          if !current_user || current_user.id != @user.id
            redirect_to(homepage_url, :notice =>"You do not have access to that page")
          end
        else
          redirect_to(homepage_url, :notice =>"You do not have access to that page")
        end
      end
end
