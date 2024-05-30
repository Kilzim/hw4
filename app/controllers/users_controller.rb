class UsersController < ApplicationController

def users
end

def index
  @places = Place.all
end

  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])

    if @user.username.present? && @user.email.present? && @user.password.present?
    @user.save
    redirect_to "/"
    else
      flash["notice"] = "Please fill in all fields."
      render :new
    end
  end
end
