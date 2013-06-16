task add_languages: :environment do
  [:es, :fr].each do |locale|
    I18n.locale = locale

    Page.all.each do |page|
      page.photos.each do |photo|
        photo.caption ||= ""
        photo.save
      end

      page.snippets.each do |snippet|
        snippet.body ||= ""
        snippet.save

        snippet.photos.each do |photo|
          photo.caption ||= ""
          photo.save
        end
      end
    end
  end
end