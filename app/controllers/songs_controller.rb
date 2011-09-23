class SongsController < InheritedResources::Base
	belongs_to :band

  def create
    create!(:notice => 'New song added.') { collection_path }
  end

  def update
    update!(:notice => 'Song updated.'){ collection_path }
  end
end
