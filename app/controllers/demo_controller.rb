class DemoController < ApplicationController
  layout :false

  def index
    render 'index'
  end

  def hello
    @array = (1..5).to_a
    @id = params['id']
    @page = params[:page]
  end
end
