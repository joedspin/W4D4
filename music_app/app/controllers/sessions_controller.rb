class SessionsController <ApplicationController
  def new
    render :new
  end

  def create
    username = params[:user][:email]
    password = params[:user][:password]
    @user = User.find_by_credentials(username, password)
    if @user 
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid Password"]
      render :new
    end

  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

end