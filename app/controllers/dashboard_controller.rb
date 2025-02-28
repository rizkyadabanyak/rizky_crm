class DashboardController < ApplicationController

  before_action :redirect_if_not_login, only: [:index]

  def redirect_if_not_login
    redirect_to login_path unless session[:user]  # Gunakan unless untuk lebih rapi
  end


  def index

    
    user = session[:user]
    # user = session[:user]["id"]

    # byebug
    # Rails.logger.debug "Session data: #{user.inspect}"
    @user = User.find_by(id: user["id"])  # Ambil user dari session
    

    @potentialCustomers = PotentialCustomer.all
  
  end


end
