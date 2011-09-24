class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_band_session, :current_band

  private
    def current_band_session
      return @current_band_session if defined?(@current_band_session)
      @current_band_session = BandSession.find
    end

    def current_band
      return @current_band if defined?(@current_band)
      @current_band = current_band_session && current_band_session.band
    end

    def require_band
      unless current_band
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_band_session_url
        return false
      end

      if params[:band_id] && params[:band_id].to_i != current_band.id
        store_location
        flash[:notice] = "You cannot access this page"
        redirect_to '/'
        return false
      end
    end

    def require_no_band
      if current_band
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to '/'
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.url
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
