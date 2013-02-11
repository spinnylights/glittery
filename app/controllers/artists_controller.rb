class ArtistsController < ApplicationController
  def show
    @artist = Artist.find_by_id(1)
  end
end
