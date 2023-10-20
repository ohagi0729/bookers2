class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      redirect_to book_path(@book.id)
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    #@book = @user.book.page(params[:page])
  end

  def show
  end

  def destroy
  end
end
