class BandsController < ApplicationController

  def index
    @bands = Band.all.order(:name)
    render :index
  end

  def create
    band = Band.new(band_params)
    if band.save
      @band = band
      redirect_to bands_url
    else
      flash.now[:errors] = band.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      render :show
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.delete
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end


end