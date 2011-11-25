class PagesController < ApplicationController
  def index
    @page = Page.from_slug(:home)
  end

  def hostel
    @page = Page.from_slug(:hostel)
  end

  def services
    @page = Page.from_slug(:services)
  end

  def photos
    @page = Page.from_slug(:photos)
  end
end