class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @book = Book.new
     @books = @user.books
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:success] = 'You have updated user successfully.'
     redirect_to user_path(@user.id)
     else
       render :edit
     end

  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
     render "edit"
    else
     redirect_to user_path(current_user)
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
