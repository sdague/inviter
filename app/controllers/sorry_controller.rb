class SorryController < ApplicationController
    around_filter :catch_exceptions
    
    private
    def catch_exceptions
        yield
    rescue => exception
        redirect_to(:controller => "sorry")
    end
    
    public 
    def index
    end

end
