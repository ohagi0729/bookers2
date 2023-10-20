class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

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
    @user = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    #@books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
