# -*- coding: utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

$configs = Dir[Rails.root.join('db/snippets/*.yml')].inject({}) do |result, file|
  result[File.basename(file, '.yml')] = YAML.load_file(file)
  result
end

def snippet_for(slug, section)
  raise "Missing page '#{slug}'" unless $configs[slug.to_s]
  raise "Missing section '#{section}' of page '#{slug}'" unless $configs[slug.to_s][section.to_s]

  {
    :section => section.to_sym,
    :translations => [{
      :locale => 'pt-BR',
      :body => $configs[slug.to_s][section.to_s]["pt-BR"]
    },
    {
      :locale => 'en',
      :body => $configs[slug.to_s][section.to_s]["en"]
    }]
  }
end

def create_page_with(slug, sections)
  Page.create :slug => slug, :snippets_attributes => sections.map { |section| snippet_for(slug, section) }
end

Page.delete_all

#### Home Page
create_page_with(:home, [:bottom_left, :bottom_right])

#### Hostel Page
create_page_with(:hostel, [:welcome, :facilities])

#### Services Page
create_page_with(:services, [:main])

#### Rooms Page
create_page_with(:rooms, [:standard, :master1, :master2])

#### Dorms Page
create_page_with(:dorms, [:main, :dorms_2, :dorms_4, :dorms_6, :collective])

#### Photos Page
page = Page.create :slug => :photos
page.photos.create :caption => "A sample image", :image => File.open(Rails.root.join('spec/fixtures/my_photo.png'))
page.photos.create :caption => "Another sample image", :image => File.open(Rails.root.join('spec/fixtures/my_photo.png'))
page.photos.create :caption => "Yet another sample image", :image => File.open(Rails.root.join('spec/fixtures/my_photo.png'))

#### Location Page
create_page_with(:location, [:main, :directions])

#### Santa Page
create_page_with(:santa, [:main])

#### Reservation Page
create_page_with(:reservation, [:new_year_package, :carnival_package, :high_season_package, :low_season_package, :promotions, :terms_conditions])

#### Contact Page
create_page_with(:contact, [:main])
