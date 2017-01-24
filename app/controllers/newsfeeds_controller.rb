class NewsfeedsController < ApplicationController


  def index
    @message = "ALL NEWS FEEDS"
    # @newsfeeds = Newsfeed.all
    # @newsfeed_new = Newsfeed.new
  end

  def new
    @message = "New Newsfeed"
  end

  def create
    puts params[:newsfeed]

    @newsfeed = Newsfeed.create(
    name: params[:newsfeed][:name],
    address: params[:newsfeed][:address]
    )

    # respond_to invisible/present on every controller action
    # respond_to do |format|
      # If request is JS (AJAX)
      # format.js

      # If request is normal Rails way
      # format.html { redirect_to companies_path }
    # end

  end


  def show
    @newsfeed = Newsfeed.find(params[:id])

    @company_boats = @newsfeed.boats
    # @boat = Boat.new
  end


  def edit
    @message = "This is the form to edit an existing newsfeed."
    @newsfeed = Newsfeed.find(params[:id])
  end



  def update
    @newsfeed = Newsfeed.find(params[:id])
    @newsfeed.update({
      name: params[:newsfeed][:name],
      address: params[:newsfeed][:address]
      })

    if (@newsfeed)
      redirect_to url_for(:controller => :newsfeeds, :action => :index)
    else
      redirect_to url_for(:controller => :newsfeeds, :action => :edit)
    end
  end



  def destroy
    Newsfeed.delete(params[:id])
    redirect_to url_for(:controller => :newsfeeds, :action => :index)
  end



end
