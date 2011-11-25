# -*- coding: utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

configs = Dir[Rails.root.join('db/snippets/*.yml')].inject({}) do |result, file|
  result[File.basename(file, '.yml')] = YAML.load_file(file)
  result
end

#### Home Page
Page.create :slug => :home, :snippets_attributes => [
  {
    :section => :bottom_left,
    :translations => [{
      :locale => 'pt-BR',
      :body => configs["home"]["bottom_left"]["pt-BR"]
    },
    {
      :locale => 'en',
      :body => configs["home"]["bottom_left"]["en"]
    }]
  },
  {
    :section => :bottom_right,
    :translations => [{
      :locale => 'pt-BR',
      :body => configs["home"]["bottom_right"]["pt-BR"]
    },
    {
      :locale => 'en',
      :body => configs["home"]["bottom_right"]["en"]
    }]
  }
]

#### Photos Page
page = Page.create :slug => :photos
page.photos.create :caption => "A sample image", :image => File.open(Rails.root.join('spec/fixtures/my_photo.png'))
page.photos.create :caption => "Another sample image", :image => File.open(Rails.root.join('spec/fixtures/my_photo.png'))
page.photos.create :caption => "Yet another sample image", :image => File.open(Rails.root.join('spec/fixtures/my_photo.png'))
