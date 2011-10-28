class BandsController < InheritedResources::Base
  before_filter :require_no_band, :only => [:new, :create]
  before_filter :require_band, :only => [:show, :edit, :update]
  before_filter :require_admin, :only => [:index]

  def collection
    @bands = Band.where(:admin => nil)
  end

  def create
    create!(:notice => 'Welcome to Bandalicious!'){'/'}
  end

  def update
    update!(:notice => 'Band info updated!'){'/'}
  end
end
