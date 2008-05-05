require 'pp'

class EventsController < ApplicationController
    before_filter :login_required
    before_filter :admin_check
    
    # GET /events
    # GET /events.xml
    def index
        @events = Event.find(:all)
        
        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @events }
        end
    end

    # GET /events/1
    # GET /events/1.xml
    def show
        @event = Event.find(params[:id])
        @newinvitees = {:list => ""}
        @rsvps = @event.rsvps
        respond_to do |format|
            format.html # show.html.erb
            format.xml  { render :xml => @event }
        end
    end

    # GET /events/new
    # GET /events/new.xml
    def new
        @event = Event.new

        respond_to do |format|
            format.html # new.html.erb
            format.xml  { render :xml => @event }
        end
    end

    # GET /events/1/edit
    def edit
        @event = Event.find(params[:id])
    end

    # POST /events
    # POST /events.xml
    def create
        @event = Event.new(params[:event])

        respond_to do |format|
            if @event.save
                flash[:notice] = 'Event was successfully created.'
                format.html { redirect_to(@event) }
                format.xml  { render :xml => @event, :status => :created, :location => @event }
            else
                format.html { render :action => "new" }
                format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
            end
        end
    end

    # PUT /events/1
    # PUT /events/1.xml
    def update
        @event = Event.find(params[:id])

        respond_to do |format|
            if @event.update_attributes(params[:event])
                flash[:notice] = 'Event was successfully updated.'
                format.html { redirect_to(@event) }
                format.xml  { head :ok }
            else
                format.html { render :action => "edit" }
                format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
            end
        end
    end

    # DELETE /events/1
    # DELETE /events/1.xml
    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        respond_to do |format|
            format.html { redirect_to(events_url) }
            format.xml  { head :ok }
        end
    end

    def delinvitee
        event = Event.find(params[:id])
        rsvp = Rsvp.find(params[:rsvp])
        respond_to do |format|
            format.html { redirect_to(:action => "show", :id => params[:id]) }
        end
    end

    def newinvitees
        event = Event.find(params[:id])
        list = params[:list].split(/\s+/)
        list.each do |email|
            user = Person.find(:first, :conditions => ["email = ?", email])
            if not user
                user = Person.new
                user.email = email
                user.save
            end
            rsvp = Rsvp.find(:first, :conditions => ["person_id = ? and event_id = ?", user.id, event.id])
            if not rsvp
                rsvp = Rsvp.new
                rsvp.person_id = user.id
                rsvp.event_id = event.id
                rsvp.state = "na"
                rsvp.save
                InviteMailer.deliver_invite(rsvp)
            end
        end

        respond_to do |format|
            format.html { redirect_to(:action => "show", :id => params[:id]) }
        end

    end

    def admin_check
        unless current_user.login == "sdague"
            flash[:notice] = "Unauthorized access to admin area"
            redirect_to :controller => 'sorry'
        end
    end    

    
end
