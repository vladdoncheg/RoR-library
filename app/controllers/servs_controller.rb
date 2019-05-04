class ServsController < ApplicationController
  before_action :set_serv, only: [:show, :edit, :update, :destroy]

  def index
    @book = Book.find(params[:book_id])
    @servs = @book.servs.all
  end

  def show
  end

  def new
    @book = Book.find(params[:book_id])
    @serv = @book.servs.new
    @lib = @book.lib
    @reader = @lib.readers
  end

  def edit
    @lib = @book.lib
    @reader = @lib.readers
  end

  def create
    @book = Book.find(params[:book_id])
    @serv = @book.servs.new(serv_params)

    if @serv.save
      redirect_to lib_book_servs_path, notice: 'Книга успешно добавлена в библиотеку.'
    else
      render :new
    end
  end

  def update
    if @serv.update(serv_params)
      redirect_to lib_book_serv_path, notice: 'Инфорация успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @serv.destroy
    redirect_to lib_book_servs_url, notice: 'Информация успешно удалена.'
  end

  private
    def set_serv
      @book = Book.find(params[:book_id])
      @serv = @book.servs.find(params[:id])
    end

    def serv_params
      params.require(:serv).permit(:book_id, :reader_id, :start, :finish)
    end
end
