class HomeController < ApplicationController
  def index
    if current_band
      flash.keep

      if current_band.admin?
        redirect_to bands_path
      else
        redirect_to band_songs_path(current_band)
      end
    else
      @band_session = BandSession.new
    end
  end
end
