class UsersController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
    redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user), notice:'You have updated user successfully.'
    else
    render:edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
