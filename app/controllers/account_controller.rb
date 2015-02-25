class AccountController < ApplicationController
  def login
  	@businessowner = Businessowner.new
  end

  def register
  end

  def fpassword
  end

  def logout
  	cookies[:id] = nil
  	session[:user_id] =nil
  	flash[:error] = "You have been logged out successfully."
  	redirect_to "/account/login"
  end
end
