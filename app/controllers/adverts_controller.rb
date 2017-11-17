class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy]

  # GET /adverts
  # GET /adverts.json
  def index
    @adverts = Advert.all
  end

  # GET /adverts/1
  # GET /adverts/1.json
  def show
  end

  # GET /adverts/new
  def new
    @advert = Advert.new
  end

  # GET /adverts/1/edit
  def edit
  end

  # POST /adverts
  # POST /adverts.json
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

  # PATCH/PUT /adverts/1
  # PATCH/PUT /adverts/1.json
  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to @advert, notice: 'Advert was successfully updated.' }
        format.json { render :show, status: :ok, location: @advert }
      else
        format.html { render :edit }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverts/1
  # DELETE /adverts/1.json
  def destroy
    @advert.destroy
    respond_to do |format|
      format.html { redirect_to adverts_url, notice: 'Advert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_advert
    @advert = Advert.find(params[:id])
  end
  
  #def advert_params
  #  #params.require(:project).permit(:description,  images_attributes: [:id, :parent_type, :parent_id, :attachment, :_destroy])
  #  params.require(:advert).permit!
  #end

  def advert_params
    params.require(:advert).permit(:description, :avatar, :user_id)
  end

  #def advert_params
  #  params.require(:advert).permit(:description, :user_id, :picture_attributes => [:id, :image, :imageable_id, :imageable_type, :_destroy])
  #end
end
