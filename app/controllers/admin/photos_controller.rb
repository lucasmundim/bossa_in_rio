class Admin::PhotosController < Admin::ApplicationController
  before_filter :load_imageable

  def new
    @photo = @imageable.photos.build
  end

  def create
    @photo = @imageable.photos.build photo_params
    @photo.caption_translations = params[:caption_translations]
    if @photo.save && @imageable.save
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

    if params[:caption_translations]
      @photo.caption_translations = params[:caption_translations]
      @imageable.save
    end

    if @photo.update_attributes(photo_params)
      respond_to do |format|
        format.html { redirect_to redirect_to_imageable, :notice => 'Foto alterada com sucesso.' }
        format.js do
          flash.now[:notice] = 'Tamanho da foto alterado com sucesso'
        end
      end
    else
      render :action => "new"
    end
  end

  def destroy
    @photo = Photo.find params[:id]
    @photo.destroy

    redirect_to redirect_to_imageable, :notice => 'Foto removida com sucesso.'
  end

  def reorder
    params[:photo].map { |id| Photo.find(id) }.each_with_index do |photo, index|
      photo.order = index
      photo.save
    end

    flash.now[:notice] = "Fotos reordenadas com sucesso."
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

    def photo_params
      params.require(:photo).permit!
    end
end
