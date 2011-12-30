namespace :photos do
  desc 'Recreate photo versions'
  task :recreate => :environment do
    Page.all.each do |page|
      page.photos.each do |photo|
        photo.image.recreate_versions!
      end

      page.snippets.each do |snippet|
        snippet.photos.each do |photo|
          photo.image.recreate_versions!
        end
      end
    end
  end

  desc 'Fix legacy photo versions'
  task :fix_legacy => :environment do
    Page.all.each do |page|
      puts page.slug
      page.photos.each do |photo|
        puts photo.thumb_version
        unless photo.image.versions.keys.include? photo.thumb_version.to_sym
          photo.thumb_version = :thumb
          photo.save
        end
      end

      page.snippets.each do |snippet|
        puts snippet.section
        snippet.photos.each do |photo|
          puts photo.thumb_version
          unless photo.image.versions.keys.include? photo.thumb_version.to_sym
            photo.thumb_version = :thumb
            photo.save
          end
        end
      end
      page.save
    end
  end
end