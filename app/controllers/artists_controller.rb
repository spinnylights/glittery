class ArtistsController < ApplicationController
  def index
  end

  def show
    @artist = Artist.find_by_id(1)
  end
end
