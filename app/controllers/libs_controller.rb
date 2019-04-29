class LibsController < ApplicationController
  before_action :set_lib, only: [:show, :edit, :update, :destroy]

  def index
    @libs = Lib.all
  end

  def show
  end

  def new
    @lib = Lib.new
  end

  def edit
  end

  def create
    @lib = Lib.new(lib_params)

    if @lib.save
      redirect_to @lib, notice: 'Lib was successfully created.'
    else
      render :new
    end
  end

  def update
    if @lib.update(lib_params)
      redirect_to @lib, notice: 'Lib was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @lib.destroy
    redirect_to libs_url, notice: 'Lib was successfully destroyed.'
  end

  private
    def set_lib
      @lib = Lib.find(params[:id])
    end

    def lib_params
      params.require(:lib).permit(:number, :name, :adress)
    end
end
