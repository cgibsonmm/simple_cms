class DemoController < ApplicationController

  def index
    render 'index'
  end

  def hello
    @array = (1..5).to_a
    @id = params['id']
    @page = params[:page]
  end

  def escape_outpt
  end

  def calendar
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
