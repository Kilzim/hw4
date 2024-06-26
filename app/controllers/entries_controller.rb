class EntriesController < ApplicationController

  def new
  end

  def create
    if @user != nil
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = params["place_id"]
      @entry["user_id"] = params["user_id"]
      @entry.uploaded_image.attach(params["uploaded_image"])

      if @entry.title.present? && @entry.description.present? && @entry.occurred_on.present?
        @entry.save
        redirect_to "/places/#{@entry["place_id"]}"
      else
        flash["notice"] = "Please fill in all fields."
        render :new
      end

    else
      flash["notice"] = "Login first."
      redirect_to "/places/"
    end
    
  end

end

