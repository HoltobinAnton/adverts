class AdvertsController < ApplicationController
  load_and_authorize_resource only: [:create, :update, :destroy, :edit]
  before_action :set_advert, only: [:show, :edit, :update, :destroy]

  def index
    @items = params[:search].nil? ? Advert.all : Advert.search(params[:search])
  end

  def show
  end

  def new
    @advert = Advert.new
  end

  def edit
  end

  def create
   @advert = Advert.new(advert_params)

   respond_to do |format|
     if @advert.save
       format.html { redirect_to @advert, notice: 'Advert was successfully created.' }
     else
       format.html { render action: 'new' }
     end
   end
 end

  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to @advert, notice: 'Advert was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @advert.destroy
    respond_to do |format|
      format.html { redirect_to adverts_url, notice: 'Advert was successfully destroyed.' }
    end
  end

  private

  def set_advert
    @advert = Advert.find(params[:id])
  end
  
  def advert_params
    params.require(:advert).permit(:description, :avatar, :user_id)
  end

end
