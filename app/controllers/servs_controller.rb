class ServsController < ApplicationController
  before_action :set_serv, only: [:show, :edit, :update, :destroy]

  def index
    @servs = Serv.all
  end

  def show
  end

  def new
    @serv = Serv.new
  end

  def edit
  end

  def create
    @serv = Serv.new(serv_params)

    if @serv.save
       redirect_to @serv, notice: 'Serv was successfully created.'
    else
      render :new
    end
  end

  def update
    if @serv.update(serv_params)
      redirect_to @serv, notice: 'Serv was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @serv.destroy
    redirect_to servs_url, notice: 'Serv was successfully destroyed.'
  end

  private
    def set_serv
      @serv = Serv.find(params[:id])
    end

    def serv_params
      params.require(:serv).permit(:book_id, :reader_id, :start, :finish)
    end
end
