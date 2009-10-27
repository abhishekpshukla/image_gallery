class SearchImagesController < ApplicationController
  current_tab :image

  def search_by_tag
    @images = Image.find_tagged_with(params[:tag_list])
    @result = params[:tag_list].to_a
  end

  def search_by_bucket
    user = User.find_by_bucket_name(params[:bucket_name])
    unless user.nil?
      @images = user.images
      @result = params[:bucket_name]
    end
  end
end
