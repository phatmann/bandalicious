class MembersController < InheritedResources::Base
  belongs_to :band
  before_filter :require_band

  def create
    create!(:notice => 'Band member added.') { collection_path }
  end

  def update
    update!(:notice => 'Band member updated.') { collection_path }
  end
end
