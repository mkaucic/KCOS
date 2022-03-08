class Admin::EventsController < Admin::BaseController
	 before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.from_param(params[:id]) || not_found
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @toggle_edit_button = true
  end

  def toggle_starred
    event = Event.from_param(params[:id]) || not_found
    updated = event.update(starred: !event.starred)
    if updated
      redirect_to admin_events_path, notice: "Događaj je #{event.starred ? 'istaknut' : 'uklonjen sa popisa istaknutih'}"
    else
      redirect_to admin_events_path, notice: "Greška"
    end
  end

  
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html {redirect_to admin_event_event_images_path(@event.slug), notice: 'Događaj uspješno dodan.'}
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
      if @event.update(event_params)
        format.html { redirect_to admin_events_path, notice: 'Događaj uspješno ažuriran.' }
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
      format.html { redirect_to admin_events_path, notice: 'Događaj uspješno obrisan.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.from_param(params[:id]) || not_found
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:image, :headline, :start_date, :end_date, :starting_at, :event_type, :text, :starred, :slug, :brief, :price)
    end
end
