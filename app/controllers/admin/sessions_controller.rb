class Admin::SessionsController < Admin::ApplicationController
  before_action :authorize, except: [:index, :create]


  def new
    redirect_to admin_dashboard_index_url if current_user
  end

  def index
    @user = User.find_by(fullname: params[session[:current_user_id]])
  end

  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    if @user
      
      session[:current_user_id] = @user.id
      redirect_to admin_dashboard_index_url, notice: @user.fullname + ' is logged in'
    
    else
      
      flash[:alert] = 'There is a problem with your username or password.'
      render :index

    end

  end

  def destroy
    session[:current_user_id] = nil
    redirect_to '/login', notice: 'You have logged out.' 
  end
end
