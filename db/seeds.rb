# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

imagens = %w(http://www.thewaterfrontbrewery.com/wp-content/uploads/2016/05/thebrewery.jpg
http://www.mikehessbrewing.com/wp-content/uploads/2013/08/Hess_Hero_slider8.jpg
http://dm8cyuj6t42zr.cloudfront.net/wp-content/uploads/2013/01/24210341/brewery-large.jpg
http://www.biscaynebaybrewing.com/img/content/about-L.jpg?v=1.0.0)

bairros = %w(Água\ Rasa‎
Alto\ de\ Pinheiros‎
Anhanguera‎
Aricanduva‎
Artur\ Alvim‎
Barra\ Funda‎
Bela\ Vista‎
Belém‎
Bom\ Retiro‎
Brasilândia‎
Butantã‎
Cachoeirinha‎
Cambuci‎
Campo\ Belo‎
Campo\ Grande
Campo\ Limpo‎
Cangaíba‎
Capão\ Redondo‎
Carrão‎
Casa\ Verde‎
Cidade\ Ademar‎
Cidade\ Ademar‎
Cidade\ Dutra‎
Cidade\ Líder‎
Cidade\ Líder‎
Cidade\ Tiradentes‎
Consolação‎
Cursino‎
Ermelino\ Matarazzo‎
Freguesia\ do\ Ó‎
Grajaú‎
Guaianases‎
Iguatemi‎
Ipiranga‎
Itaim\ Bibi‎
Itaim\ Paulista‎
Itaquera‎
Jabaquara‎
Jaçanã‎
Jaguara‎
Jaguaré‎
Jaraguá‎
Jardim\ Ângela‎
Jardim\ Helena‎
Jardim\ Paulista‎
Jardim\ São\ Luís‎
Lapa‎
Liberdade‎
Limão‎
Mandaqui‎
Marsilac‎
Moema‎
Mooca‎
Morumbi‎
Parelheiros‎
Pari‎
Parque\ do\ Carmo‎
Penha‎
Perdizes‎
Pinheiros
Pirituba‎
Ponte\ Rasa
Raposo\ Tavares‎
República‎
Rio\ Pequeno‎
Sacomã‎
Santa\ Cecília‎
Santana‎
Santo\ Amaro‎\ (10\ P)
São\ Domingos‎
São\ Lucas‎
São\ Mateus‎
São\ Miguel\ Paulista‎
São\ Rafael‎
Sapopemba‎
Saúde‎
Sé‎
Tatuapé
Tremembé‎
Tucuruvi
Vila\ Andrade‎
Vila\ Curuçá
Vila\ Formosa‎
Vila\ Guilherme‎
Vila\ Jacuí‎
Vila\ Leopoldina‎
Vila\ Maria‎
Vila\ Mariana‎d
Vila\ Matilde‎
Vila\ Medeiros‎d
Vila\ Prudente‎
Vila\ Sônia‎)

20.times do
  user = User.new
  user.email = Faker::Internet.email
  pass = Faker::Internet.password
  user.password = pass
  user.password_confirmation = pass
  user.save
end

10.times do
  facility = Facility.new
  facility.name = "Cervejaria " + Faker::Beer.name
  facility.description = Faker::Company.catch_phrase
  facility.equipments_description = Faker::Hipster.sentences.join(" ")
  facility.producing_capability = ((10..100).to_a.sample)*1000
  facility.address = bairros.sample + ", sao paulo"
  facility.user_id = (1..User.count).to_a.sample
  facility.save
  facility.photo_urls = [] << imagens.sample
  sleep(5)
end

50.times do
  booking = Booking.new
  booking.user_id = (1..User.count).to_a.sample
  booking.facility_id = (1..Facility.count).to_a.sample
  booking.start_date = Faker::Date.forward(20)
  booking.end_date = booking.start_date + (1..7).to_a.sample
  booking.save
end

