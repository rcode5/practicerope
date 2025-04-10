# frozen_string_literal: true

module Admin
  class TracksController < AdminController
    def index
      @published, @unpublished = Track.by_recency.partition(&:published)

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @tracks }
      end
    end

    def show
      @track = Track.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @track }
      end
    end

    def new
      @track = Track.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @track }
      end
    end

    def clone
      @track = Track.find(params[:id]).dup
      @track.published = false
      render 'new'
    end

    def edit
      @track = Track.find(params[:id])
    end

    def create
      @track = Track.new(track_params)
      respond_to do |format|
        if @track.save
          format.html { redirect_to admin_track_path(@track), notice: 'Track was successfully created.' }
          format.json { render json: @track, status: :created, location: @track }
        else
          format.html { render action: 'new' }
          format.json { render json: @track.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @track = Track.find(params[:id])
      respond_to do |format|
        if @track.update(track_params)
          format.html { redirect_to admin_track_path(@track), notice: 'Track was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @track.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @track = Track.find(params[:id])
      @track.destroy

      respond_to do |format|
        format.html { redirect_to admin_tracks_url }
        format.json { head :no_content }
      end
    end

    private

    def track_params
      recorded_on = recorded_on_from_params
      attrs = params.require(:track).permit(
        :audio,
        :author,
        :description,
        :display_title,
        :published,
        :recorded_on,
        :title,
      )
      attrs[:recorded_on] = recorded_on if recorded_on
      attrs
    end

    def recorded_on_from_params
      track_params = params.permit(:recorded_on_day, :recorded_on_time)
      recorded_on = [track_params[:recorded_on_day], track_params[:recorded_on_time]].compact(&:present?).join(' ')
      Time.zone.parse(recorded_on)
    end
  end
end
