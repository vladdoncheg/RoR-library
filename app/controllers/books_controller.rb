class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @lib = Lib.find(params[:lib_id])
    @books = @lib.books.all.paginate page: params[:page], per_page: 20
  end

  def show
    @busy = @book.servs.where('finish is null')
    if @busy.any?
      @status = 'Занята'
    else
      @status = 'Свободна'
    end
  end

  def new
    @lib = Lib.find(params[:lib_id])
    @book = @lib.books.new
  end

  def edit
  end

  def create
    @lib = Lib.find(params[:lib_id])
    @book = @lib.books.new(book_params)

    if @book.save
      redirect_to lib_books_path, notice: 'Книга успешно добавлена в библиотеку'
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to lib_book_path, notice: 'Информация о книге успешно обновлена'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to lib_books_path, notice: 'Книга успешно удалена из библиотеки'
  end

  private
    def set_book
      @lib = Lib.find(params[:lib_id])
      @book = @lib.books.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :author, :code, :publisher, :year, :price, 
                                   :date, :lib_id)
    end
end
