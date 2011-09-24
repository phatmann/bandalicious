class BandSessionsController < ApplicationController
  before_filter :require_no_band, :only => [:new, :create]
  before_filter :require_band, :only => :destroy
  layout 'home'

  def new
    @band_session = BandSession.new
  end
  
  def create
    @band_session = BandSession.new(params[:band_session])

    if @band_session.save
      redirect_back_or_default '/'
    else
      render :action => :new
    end
  end
  
  def destroy
    current_band_session.destroy
    flash[:notice] = "You are now logged out"
    redirect_back_or_default '/'
  end
end
