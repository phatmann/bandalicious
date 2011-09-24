class HomeController < ApplicationController
  def index
    if current_band
      flash.keep
      redirect_to band_songs_path(current_band)
    else
      @band_session = BandSession.new
    end
  end
end
