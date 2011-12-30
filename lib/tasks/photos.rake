namespace :photos do
  desc 'Recreate photo versions'
  task :recreate => :environment do
    Page.all.each do |page|
      page.photos.each do |photo|
        photo.image.recreate_versions!
      end

      page.snippets do |snippet|
        snippet.photos.each do |photo|
          photo.image.recreate_versions!
        end
      end
    end
  end
end