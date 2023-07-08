class OrchestrasController < ApplicationController
  def index
    @orchestras = Orchestra.all #['Orch 1','Orch 2','Orch 3'] 
  end

  def new
  end

  def create
    orchestra = Orchestra.new({
      name: params[:orchestra][:name],
      city: params[:orchestra][:city]
    })

    orchestra.save

    redirect_to '/tasks'
  end

  def info
    require 'pry'; binding.pry
  end
end