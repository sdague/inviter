class RsvpsController < ApplicationController    
    before_filter :login_required
    
    # GET /rsvps
    # GET /rsvps.xml
#     def index
#         @rsvps = Rsvp.find(:all)

#         respond_to do |format|
#             format.html # index.html.erb
#             format.xml  { render :xml => @rsvps }
#         end
#     end

#     # GET /rsvps/1
#     # GET /rsvps/1.xml
#     def show
#         @rsvp = Rsvp.find(params[:id])

#         respond_to do |format|
#             format.html # show.html.erb
#             format.xml  { render :xml => @rsvp }
#         end
#     end

#     # GET /rsvps/new
#     # GET /rsvps/new.xml
#     def new
#         @rsvp = Rsvp.new

#         respond_to do |format|
#             format.html # new.html.erb
#             format.xml  { render :xml => @rsvp }
#         end
#     end

#     # GET /rsvps/1/edit
#     def edit
#         @rsvp = Rsvp.find(params[:id])
#     end

#     # POST /rsvps
#     # POST /rsvps.xml
#     def create
#         @rsvp = Rsvp.new(params[:rsvp])

#         respond_to do |format|
#             if @rsvp.save
#                 flash[:notice] = 'Rsvp was successfully created.'
#                 format.html { redirect_to(@rsvp) }
#                 format.xml  { render :xml => @rsvp, :status => :created, :location => @rsvp }
#             else
#                 format.html { render :action => "new" }
#                 format.xml  { render :xml => @rsvp.errors, :status => :unprocessable_entity }
#             end
#         end
#     end

#     # PUT /rsvps/1
#     # PUT /rsvps/1.xml
#     def update
#         @rsvp = Rsvp.find(params[:id])

#         respond_to do |format|
#             if @rsvp.update_attributes(params[:rsvp])
#                 flash[:notice] = 'Rsvp was successfully updated.'
#                 format.html { redirect_to(@rsvp) }
#                 format.xml  { head :ok }
#             else
#                 format.html { render :action => "edit" }
#                 format.xml  { render :xml => @rsvp.errors, :status => :unprocessable_entity }
#             end
#         end
#     end

    # DELETE /rsvps/1
    # DELETE /rsvps/1.xml
    def destroy
        @rsvp = Rsvp.find(params[:id])
        if rsvp.event.user.id == current_user.id
            @rsvp.destroy
        else
            flash[:error] = "Attempting to delete an RSVP that you can't"
        end
        
        respond_to do |format|
            format.html { redirect_to :back }
            format.xml  { head :ok }
        end
    end
    
end
