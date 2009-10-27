class ImagesController < ApplicationController
  current_tab :image
  #before_filter :require_no_user, :only => [:show, :index]
  before_filter :require_user, :only => [:new, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def view_by_bucket
    @images = Image.find_all_by_user_id(params[:id])
  end

  def show; end

  def new
    @image = Image.new
  end

  def create
    unless params[:image][:avatar].blank?
      params[:image].merge!(:user_id => current_user.id)
      Image.transaction do
        @image = Image.create(params[:image])
        unless params[:image][:tag_list].blank?
          @image.tag_list = params[:image][:tag_list].to_s
          @image.save
        end
        flash[:notice] = "Image uploaded successfully."
      end
    else
      flash[:notice] = "Please select a image to upload."
    end
    respond_to do |format|
      format.html { redirect_to new_image_url}
    end
  end
end
