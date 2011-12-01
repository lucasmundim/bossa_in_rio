class Admin::PhotosController < Admin::ApplicationController
  def index
    @photos = Photo.grouped_by_tags(Page.all.map(&:slug))
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new params[:photo]
    if @photo.set_translations(params[:translations])
      redirect_to admin_photos_path, :notice => 'Photo adicionada com sucesso.'
    else
      render :action => "new"
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find params[:id]
    if @photo.update_attributes(params[:photo]) && @photo.set_translations(params[:translations])
      redirect_to admin_photos_path, :notice => 'Photo adicionada com sucesso.'
    else
      render :action => "new"
    end
  end

  def destroy
    @photo = Photo.find params[:id]
    @photo.destroy

    redirect_to admin_photos_path
  end
end