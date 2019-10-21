class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: settion_params[:email])
    if user && user.authenticate(settion_params[:password])
      log_in(user)
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: "ログアウトしました"
  end
  
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def settion_params
    params.require(:session).permit(:email, :password)
  end
end
