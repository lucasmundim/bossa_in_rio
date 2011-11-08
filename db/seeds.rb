# -*- coding: utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Page.create :slug => :home, :snippets_attributes => [
  {
    :section => :bottom_left, :body => %(
h1(destaque). Bem-vindo ao <br>Bossa in Rio Hostel

h3. Rio de Janeiro | Brasil

Desenhado para satisfazer todas as suas expectativas e proporcionar uma estada inesquecível, num ambiente requintado, com atmosfera propensa a amizade.
)
  },
  {
    :section => :bottom_right, :body => %(
h2(destaque). Estamos no bairro <br> mais charmoso do Rio

h3. Rio de Janeiro | Brasil

Repleto de arte, lojas, bares e restaurantes. Suas ruas recebem festivais de artes e gastronomia, blocos de carnaval, apresentações de samba e cultura.
)
  }
]
