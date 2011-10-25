class SongsController < InheritedResources::Base
	belongs_to :band
  before_filter :require_band
  custom_actions :collection => :sort
  
  def index
    @edit = params[:edit]
    index!
  end

  def create
    create!(:notice => 'New song added.') { collection_path }
  end

  def update
    update!(:notice => 'Song updated.'){ collection_path }
  end

  def sort
    song_ids = params['song'] || []

    song_ids.each_with_index do |song_id, index|
      song = Song.find(song_id)
      song.position = index + 1
      song.save
    end

    head :created
  end
end
