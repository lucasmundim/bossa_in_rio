class Admin::PagesController < Admin::ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def by_slug
    @page = Page.where(:slug => params[:slug]).first
    render :action => :show
  end
end
