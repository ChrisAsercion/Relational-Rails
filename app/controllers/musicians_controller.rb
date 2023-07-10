class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
  end

  def info
    @musician_info = Musician.find(params[:id])
  end
end