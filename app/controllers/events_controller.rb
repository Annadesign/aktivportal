class EventsController < ApplicationController


  def index

    if params[:tag]
 
      @events = Event.filter_by_tags(params[:tag])

      @tag = Tag.find_by_name(params[:tag])

    elsif

      params[:search].present?
      @events = Event.matching_title_or_content(params[:search])  

    else
  
      @events = Event.all.where(:publish => true).order(:id => :asc)
 
    end    
    #render :layout => 'list_page'
      @tags = Tag.promote

  end

  def home
    @events = Event.all  
    @tags = Tag.promote    
  end

  def show
    @event = Event.find(params[:id])
    #render :layout => 'show_page'
    @tags = Tag.promote
  end

  def search_event
    params[:search].present?
    @events = Event.matching_title_or_content(params[:search])  
   # render :layout => 'list_page'
     @tags = Tag.promote
  end
end
