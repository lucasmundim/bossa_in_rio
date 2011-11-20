class Admin::SnippetsController < Admin::ApplicationController
  def edit
    @page = Page.find(params[:page_id])
    @snippet = @page.snippets.find(params[:id])
  end
end