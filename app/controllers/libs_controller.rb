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
      redirect_to @lib, notice: 'Библиотека успешно добавлена.'
    else
      render :new
    end
  end

  def update
    if @lib.update(lib_params)
      redirect_to @lib, notice: 'Информация о библиотеке успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @lib.destroy
    redirect_to libs_path, notice: 'Библиотека успешно удалена.'
  end

  def top
    @lib = Lib.find(params[:id])
    @servs = @lib.servs
  end

  private
    def set_lib
      @lib = Lib.find(params[:id])
    end

    def lib_params
      params.require(:lib).permit(:number, :name, :adress)
    end
    
end
