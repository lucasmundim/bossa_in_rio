class Admin::SnippetsController < Admin::ApplicationController
  def edit
    @page = Page.find(params[:page_id])
    @imageable = @snippet = @page.snippets.find(params[:id])
  end

  def update
    @page = Page.find(params[:page_id])
    @imageable = @snippet = @page.snippets.find(params[:id])
    @snippet.body_translations = params[:body_translations]
    if @snippet.save
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

  def reorder
    @page = Page.find(params[:page_id])
    params[:snippet].map { |id| @page.snippets.find(id) }.each_with_index do |snippet, index|
      snippet.order = index
      snippet.save
    end

    flash.now[:notice] = "Snippets reordenados com sucesso."
  end
end
