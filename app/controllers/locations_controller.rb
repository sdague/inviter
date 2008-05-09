class LocationsController < ApplicationController
    before_filter :login_required

    # GET /locations
    # GET /locations.xml
    def index
        @locations = current_user.locations.find(:all)

        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @locations }
        end
    end

    # GET /locations/1
    # GET /locations/1.xml
    def show
        @location = current_user.locations.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.xml  { render :xml => @location }
        end
    end

    # GET /locations/new
    # GET /locations/new.xml
    def new
        @location = Location.new

        respond_to do |format|
            format.html # new.html.erb
            format.xml  { render :xml => @location }
        end
    end

    # GET /locations/1/edit
    def edit
        @location = current_user.locations.find(params[:id])
    end

    # POST /locations
    # POST /locations.xml
    def create
        @location = current_user.locations.build(params[:location])

        respond_to do |format|
            if @location.save
                flash[:notice] = 'Location was successfully created.'
                format.html { redirect_to(@location) }
                format.xml  { render :xml => @location, :status => :created, :location => @location }
            else
                format.html { render :action => "new" }
                format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
            end
        end
    end

    # PUT /locations/1
    # PUT /locations/1.xml
    def update
        @location = current_user.locations.find(params[:id])

        respond_to do |format|
            if @location.update_attributes(params[:location])
                flash[:notice] = 'Location was successfully updated.'
                format.html { redirect_to(@location) }
                format.xml  { head :ok }
            else
                format.html { render :action => "edit" }
                format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
            end
        end
    end

    # DELETE /locations/1
    # DELETE /locations/1.xml
    def destroy
        @location = current_user.locations.find(params[:id])
        @location.destroy

        respond_to do |format|
            format.html { redirect_to(locations_url) }
            format.xml  { head :ok }
        end
    end
end
