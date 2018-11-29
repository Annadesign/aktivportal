class Admin::DashboardController < Admin::ApplicationController
  
  def index
 	@events = Event.all
  end

end
