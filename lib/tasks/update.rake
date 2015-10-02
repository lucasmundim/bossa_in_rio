namespace :update do
  desc 'Update schema'
  task :schema => :environment do
    Page.all.each do |page|
      page.snippets.each do |snippet|
        if snippet.attributes['translations'].present?
          snippet.body_translations = snippet.attributes['translations'].inject({}) { |h,i| h.merge(i['locale'] => i['body']) }
          snippet.unset(:translations)
        end
      end
      page.save
    end

    Photo.all.each do |photo|
      if photo.attributes['translations'].present?
        photo.attributes['translations']
        photo.caption_translations = photo.attributes['translations'].inject({}) { |h,i| h.merge(i['locale'] => i['caption']) }
        photo.save
        photo.unset(:translations)
      end
    end
  end
end
