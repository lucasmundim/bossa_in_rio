class Admin::PhotosController < Admin::ApplicationController
  before_filter :load_page

  def new
    @photo = @page.photos.build
  end

  def create
    @photo = @page.photos.build params[:photo]
    if @photo.set_translations(params[:translations]) && @page.save
      redirect_to admin_page_path(@page), :notice => 'Photo adicionada com sucesso.'
    else
      render :action => "new"
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find params[:id]
    if @photo.update_attributes(params[:photo]) && @photo.set_translations(params[:translations]) && @page.save
      redirect_to admin_page_path(@page), :notice => 'Photo adicionada com sucesso.'
    else
      render :action => "new"
    end
  end

  def destroy
    @photo = Photo.find params[:id]
    @photo.destroy

    redirect_to admin_page_path(@page)
  end

  private
    def load_page
      @page = Page.find(params[:page_id])
    end
end