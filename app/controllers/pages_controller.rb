class PagesController < ApplicationController

  def home
  end

  def shorten
    @link = Link.new (link_params)
    if @link.save
      @short_url = @link.id.to_s(36)
      render :success

    end
  end

  def redirect
    id = params[:hash].to_i(36)
    redirect_to Link.find(id).long_url
  end

  private
  def link_params
    params.require(:shorten).permit(:long_url)
  end



end
