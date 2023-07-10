class OrchestrasController < ApplicationController 
  def index
    @orchestras = Orchestra.order('created_at DESC')  
  end

  def new
  end

  def create
    orchestra = Orchestra.new({
      name: params[:orchestra][:name],
      city: params[:orchestra][:city]
    })

    orchestra.save

    redirect_to '/orchestras'
  end

  def info
    @orch_info = Orchestra.find(params[:id])
  end

  def tables
    @current_group = Orchestra.find(params[:id])
    @orchestra_musicians = Musician.all
    @musician_finder = []
    @orchestra_musicians.each do |musician|
      if musician.orchestra_id == @current_group.id
        @musician_finder << musician
      end
    end
  end
end