class PagesController < ApplicationController
  def index
    @page = Page.from_slug(:home)
  end
end