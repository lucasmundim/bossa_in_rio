class Admin::PhotosController < Admin::ApplicationController
  before_filter :load_imageable

  def new
    @photo = @imageable.photos.build
  end

  def create
    @photo = @imageable.photos.build params[:photo]
    if @photo.set_translations(params[:translations]) && @imageable.save
      redirect_to redirect_to_imageable, :notice => 'Foto adicionada com sucesso.'
    else
      render :action => "new"
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find params[:id]
    if @photo.update_attributes(params[:photo]) && @photo.set_translations(params[:translations]) && @imageable.save
      redirect_to redirect_to_imageable, :notice => 'Foto alterada com sucesso.'
    else
      render :action => "new"
    end
  end

  def destroy
    @photo = Photo.find params[:id]
    @photo.destroy

    redirect_to redirect_to_imageable, :notice => 'Foto removida com sucesso.'
  end

  private
    def load_page
      @page = Page.find(params[:page_id])
    end

    def load_snippet
      @snippet = @page.snippets.find(params[:snippet_id]) if params[:snippet_id]
    end

    def load_imageable
      load_page
      load_snippet
      @imageable = @snippet || @page
    end

    def redirect_to_imageable
      if @imageable.is_a?(Snippet)
        edit_admin_page_snippet_path(@page, @snippet)
      else
        admin_page_path(@page)
      end
    end
end