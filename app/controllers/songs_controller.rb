class SongsController < InheritedResources::Base
	belongs_to :band

  def create
    create!{ collection_path }
  end

  def update
    update!{ collection_path }
  end
end
