class OrchestrasController < ApplicationController 
  def index
    @orchestras = Orchestra.order('created_at DESC')  
  end

  def new
  end

  def create
    orchestra = Orchestra.new({name: params[:orchestra][:name], chairs:params[:orchestra][:chairs],
    conductor: params[:orchestra][:conductor], 
    active:params[:orchestra][:active], venue:params[:orchestra][:venue]})

    orchestra.save
    
    redirect_to '/orchestras'
  end

  def info
    @orch_info = Orchestra.find(params[:id])
    @musician_finder = []
    @orchestra_musicians = Musician.all
    @orchestra_musicians.each do |musician|
      if musician.orchestra_id == @orch_info.id
        @musician_finder << musician
      end
    end
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

  def orchestra_params
    params.permit(:name, :chairs, :conductor, :active, :venue)
  end

  def edit 
    @current_group = Orchestra.find(params[:id])
    @current_group.save
    
  end
end