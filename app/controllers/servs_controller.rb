class ServsController < ApplicationController
  before_action :set_serv, only: [:show, :edit, :update, :destroy]

  def index
    @book = Book.find(params[:book_id])
    @servs = @book.servs.all.paginate page: params[:page], per_page: 20
  end

  def show
  end

  def new
    @book = Book.find(params[:book_id])
    @serv = @book.servs.new
    @lib = @book.lib
    @reader = @lib.readers
    @busy = @book.servs.where('finish is null')
    if @busy.any?
      redirect_to lib_book_servs_path, alert: 'Действие невозможно выполнить. 
                                               Книга не возвращена прошлым абонентом'
    end
  end

  def edit
    @lib = @book.lib
    @reader = @lib.readers
  end

  def create
    @book = Book.find(params[:book_id])
    @serv = @book.servs.new(serv_params)
    @lib = @book.lib
    @reader = @lib.readers
    if @serv.save
      redirect_to lib_book_servs_path, notice: 'Выдача книги успешно добавлена'
    else
      render :new
    end
  end

  def update
    @lib = @book.lib
    @reader = @lib.readers
    if @serv.update(serv_params)
      redirect_to lib_book_serv_path, notice: 'Инфорация о выдаче книги успешно обновлена'
    else
      render :edit
    end
  end

  def destroy
    @serv.destroy
    redirect_to lib_book_servs_path, notice: 'Информация о выдаче книги успешно удалена'
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
