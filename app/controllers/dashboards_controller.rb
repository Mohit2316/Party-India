class DashboardsController < ApplicationController
  def index
  	if get_current_user!= nil
  		@events = Event.where(businessowner_id:session[:user_id])
  		@event = Event.new
  		@businessowner = get_current_user
      @headline = "My Events" 
  	else
  		flash[:error] = "Your session has expired, please log in again"
  		redirect_to "/account/login"
  	end
  end

  def admin
    if get_current_user!= nil && get_current_user.role =="Admin"
      @events = Event.where(is_approved:nil)
      @event = Event.new
      @businessowner = get_current_user
      @headline = "All Unapproved Events"
      render "index"
    else
      flash[:error] = "Your session has expired, please log in again"
      redirect_to "/Dashboard"
    end
  end

  def approved
    if get_current_user!= nil && get_current_user.role =="Admin"
      @events = Event.where(is_approved:true)
      @event = Event.new
      @businessowner = get_current_user
      @headline = "All Approved Events"
      render "index"
    else
      flash[:error] = "Your session has expired, please log in again"
      redirect_to "/Dashboard"
    end
  end


  def detail
  	# @event = Event.find(params[:id])
  	@event = Event.where(businessowner_id:session[:user_id]).first
  	
  	
  end

  private 
  	def get_current_user
  		
  		Businessowner.where(id:session[:user_id]).first
  	end

end
