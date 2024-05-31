class PlacesController < ApplicationController

  def index
    if @user != nil
      @places = Place.order(:name)
    else
      redirect_to "/users/"
    end
  end

  def show
    
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @user["id"] })
  end

  def new
  end

  def create

    if @user != nil
      @place = Place.new
      @place["name"] = params["name"]
      if @place.name.present? && Place.find_by(name: @place.name).nil?
      @place.save
      redirect_to "/places"
      else
        flash["notice"] = "Please fill in valid Place"
        render :new
      end
    else
      flash["notice"] = "Login first."
      redirect_to "/places"
    end
  end

end
