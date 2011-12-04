class Admin::PagesController < Admin::ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @imageable = @page = Page.find(params[:id])
  end

  def by_slug
    @imageable = @page = Page.where(:slug => params[:slug]).first
    render :action => :show
  end
end
