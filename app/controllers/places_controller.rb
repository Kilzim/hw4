class PlacesController < ApplicationController

  def index
    @user = User.find_by({ "id" => session["user_id"] })
    if @user != nil
      @places = Place.all
    else
      redirect_to "/users/"
    end
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"] })
  end

  def new
  end

  def create
    @user = User.find_by({ "id" => session["user_id"] })
    if @user != nil
      @place = Place.new
      @place["name"] = params["name"]
      @place.save
    else
      flash["notice"] = "Login first."
    end
    redirect_to "/places"
  end

end
