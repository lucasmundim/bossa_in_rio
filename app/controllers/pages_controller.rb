class PagesController < ApplicationController
  def index
    @page = Page.from_slug(:home)
  end

  def photos
    @page = Page.from_slug(:photos)
  end
end