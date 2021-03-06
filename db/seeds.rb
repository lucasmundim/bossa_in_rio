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
    :body_translations => {
      'pt-BR' => $configs[slug.to_s][section.to_s]["pt-BR"],
      'en' => $configs[slug.to_s][section.to_s]["en"],
      'fr' => $configs[slug.to_s][section.to_s]["fr"],
      'es' => $configs[slug.to_s][section.to_s]["es"]
    }
  }
end

def create_page_with(slug, sections)
  Page.create :slug => slug, :snippets_attributes => sections.map { |section| snippet_for(slug, section) }
end

Page.delete_all

#### Home Page
create_page_with(:home, [:bottom_left, :bottom_right])

#### Hostel Page
create_page_with(:hostel, [:main])

#### Services Page
create_page_with(:services, [:main])

#### Facilities Page
create_page_with(:facilities, [:main])

#### Rooms Page
create_page_with(:rooms, [:standard, :master1, :master2])

#### Dorms Page
create_page_with(:dorms, [:main, :dorms_2, :dorms_4, :dorms_6, :collective, :special_4, :special_5])

#### Photos Page
create_page_with(:photos, [:suites, :dorms, :common_areas, :courtyards_and_gardens])

#### Location Page
create_page_with(:location, [:main, :directions])

#### Santa Page
create_page_with(:santa, [:main])

#### Reservation Page
create_page_with(:reservation, [:new_year_package, :carnival_package, :high_season_package, :low_season_package, :promotions, :terms_conditions, :transfer_service])

#### Location Page
create_page_with(:reviews, [:main])

#### Location Page
create_page_with(:media, [:main])

#### Contact Page
create_page_with(:contact, [:main])
