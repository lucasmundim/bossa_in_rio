module Admin::NavigationHelpers
  def imageable_photos_path(imageable)
    if imageable.is_a?(Snippet)
      admin_page_snippet_photos_path(imageable.page, imageable)
    else
      admin_page_photos_path(imageable)
    end
  end

  def new_imageable_photo_path(imageable)
    if imageable.is_a?(Snippet)
      new_admin_page_snippet_photo_path(imageable.page, imageable)
    else
      new_admin_page_photo_path(imageable)
    end
  end

  def edit_imageable_photo_path(imageable, photo)
    if imageable.is_a?(Snippet)
      edit_admin_page_snippet_photo_path(imageable.page, imageable, photo)
    else
      edit_admin_page_photo_path(imageable, photo)
    end
  end

  def imageable_photo_path(imageable, photo)
    if imageable.is_a?(Snippet)
      admin_page_snippet_photo_path(imageable.page, imageable, photo)
    else
      admin_page_photo_path(imageable, photo)
    end
  end

  def imageable_reorder_photos_path(imageable)
    if imageable.is_a?(Snippet)
      reorder_admin_page_snippet_photos_path(imageable.page, imageable)
    else
      reorder_admin_page_photos_path(imageable)
    end
  end
end