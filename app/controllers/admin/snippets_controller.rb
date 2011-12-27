class Admin::SnippetsController < Admin::ApplicationController
  def edit
    @page = Page.find(params[:page_id])
    @imageable = @snippet = @page.snippets.find(params[:id])
  end

  def update
    @page = Page.find(params[:page_id])
    @imageable = @snippet = @page.snippets.find(params[:id])

    if @snippet.set_translations(params[:translations])
      redirect_to admin_page_path(@page), :notice => 'Snippet atualizado com sucesso.'
    else
      render :action => "edit"
    end
  end

  def update_status
    @page = Page.find(params[:page_id])
    @snippet = @page.snippets.find(params[:snippet_id])
    @snippet.status = !@snippet.status
    @page.save
    redirect_to admin_page_path(@page), :notice => 'Status do snippet atualizado com sucesso.'
  end
end