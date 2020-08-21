class UsersController < ApplicationController
  def index 
    user = User.all
    render json: user
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def create
    user = User.create(user_params)
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = encode(payload)
      render :json => {user: user, token: token}
    else 
        render json: {error_message: "User not found"}
    end
  end

  def login 
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        payload = {user_id: user.id}
        token = encode(payload)
        render :json => {user: user, token: token}
    else 
        render json: {error_message: "User not found"}
    end
  end

  def token_authenticate
      token = request.headers["Authenticate"]
      user = User.find(decode(token)["user_id"])
      render json: user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :password)
  end

end

# Added Some Comments