class SessionsController <ApplicationController
  def new
    render :new
  end

  def create
    username = [:user][:email]
    password = [:user][:password]
    @user = User.find_by_credentials(username, password)
    if @user 
      login_user!(@user)
      redirect_to user_url
    else
      flash.now[:errors] = ["Invalid Password"]
      render :new
    end

  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end