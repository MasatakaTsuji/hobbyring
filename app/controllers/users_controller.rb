class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update,:show, :destroy]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:usertext, :nickname)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

end
