class Admin::EventsController < Admin::ApplicationController

  def index
    if params[:search].present?
      @events = Event.matching_title_or_content(params[:search])
    else
       @events = Event.all
    end
  end

  def new
    @events = Event.all 
    @event = Event.new 

  end

   def create
      @event = Event.new(event_params)

      @event.user_id = current_user.id
      if @event.save
        redirect_to admin_events_url, notice: 'Artikkelen: ' + event_params[:title] + ' ble lagret!'
      else
        flash[:alert] = 'Kunne ikke lagre. Ser feilmeldingene for mer informasjon.'
        render :new
      end
   end

  def edit
    @events = Event.all
    @event = Event.find(params[:id])    
  end

  def update
    @event = Event.find(params[:id])
 
    if @event.update(event_params)  
      redirect_to edit_admin_event_url(@event), notice: 'Artikkelen: ' + event_params[:title] + ' ble oppdatert!'
    else
      flash[:alert] = 'Det var et problem med oppdateringen'
      render :edit
    end
  end

  def show
    @event = Event.find(params[:id])

  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_url, notice: 'Aktiviteten ble slettet!'
  end

  private

  def event_params
    params.require(:event).permit(:id, :title, :summary, :content, :date, :date_range, :start, :end, :lng, :lat, :location, :user_id, :publish, :image, :category_id, tag_ids: [])
  end

end
