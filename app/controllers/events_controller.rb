class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    render "dashboards/detail"
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    if(params[:event][:source]=='facebook')
      @event = Event.new(get_event_info_facebook)
    else
      @event = Event.new(event_params)
    end
    @event.is_approved = false
    respond_to do |format|
      if @event.save
        if params[:event][:source]=='facebook'
          format.html { redirect_to "/events/#{@event.id}/edit"}
         else 
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
        end
          format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if params[:commit]=="Approve Event"
        @event.is_approved = true
      end
      if @event.update(event_params)
        
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def get_event_info_facebook
      
      id = params[:event][:club_url].split('/').last
      @oauth = Koala::Facebook::OAuth.new('345625378972716','8d652b113a8cf8385b975a5ae77debf6', "http://www.partiko.com/")
      @graph = Koala::Facebook::API.new(@oauth.get_app_access_token)
      eventInfo = @graph.get_object(id, {}, api_version: "v2.0")
      pic = @graph.get_connections(id,"?fields=cover")
      
      location = eventInfo['venue']['city']
      timings = eventInfo['start_time']
      
      event = {:name => eventInfo['name'], :picture_url => pic['cover']['source'] ,:description => eventInfo['description'], :start_time =>eventInfo['start_time'],:end_time =>eventInfo['end_time'], :organizer => eventInfo['owner']['name'], :city =>location,:businessowner_id=>session[:user_id]}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params[:event][:businessowner_id] = session[:user_id]
      params.require(:event).permit(:name, :event_type, :organizer, :start_time, :end_time, :picture_url, :description, :street_address, :city, :country, :zip, :latitude, :longitude, :avatar,:source,:businessowner_id)
    end
end
