class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to root_path, notice: 'Advert was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Advert was successfully destroyed.' }
      format.js
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    respond_to do |format|
      if @comment.save
        format.js
      else
        format.html { redirect_to :back }
      end
    end      
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit!
  end
end
