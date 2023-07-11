class MusiciansController < ApplicationController
  def index
    @on_call_musicians= []
    @musicians = Musician.all
    @musicians.each do |musician|
      if musician.on_call
        @on_call_musicians << musician
      end
    end
  end

  def info
    @musician_info = Musician.find(params[:id])
  end

  def new
    @orchestra_id = params[:id]
  end

  def create
    musician = Musician.new({name: params[:musician][:name], instruments:params[:musician][:instruments],
    songs: params[:musician][:songs], 
    on_call:params[:musician][:on_call]})

    musician.save
    require 'pry'; binding.pry
    redirect_to "/orchestras/#{params[:id]}"
  end
end