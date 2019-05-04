class ReadersController < ApplicationController
  before_action :set_reader, only: [:show, :edit, :update, :destroy]

  def index
    @lib = Lib.find(params[:lib_id])
    @readers = @lib.readers.all
  end

  def show
  end

  def new
    @lib = Lib.find(params[:lib_id])
    @reader = @lib.readers.new
  end

  def edit
  end

  def create
    @lib = Lib.find(params[:lib_id])
    @reader = @lib.readers.new(reader_params)

    if @reader.save
      redirect_to lib_readers_path, notice: 'Абонент успешно добавлен в библиотеку.'
    else
      render :new
    end
  end

  def update
    if @reader.update(reader_params)
      redirect_to lib_reader_path, notice: 'Информация об абоненте успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @reader.destroy
    redirect_to lib_readers_path, notice: 'Абонент успешно удалён из библиотеки.'
  end

  private
    def set_reader
      @lib = Lib.find(params[:lib_id])
      @reader = @lib.readers.find(params[:id])
    end

    def reader_params
      params.require(:reader).permit(:number, :lastname, :firstname, :fathername, :adress, :phone, :lib_id)
    end
end
