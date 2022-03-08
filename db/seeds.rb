 # look up "lib/modules/seed_methods.rb"
 include SeedMethods
 require 'faker'
  puts create_title(10..70)
  puts create_paragraphs((1..4), true)

 Admin.create(first_name: "Bamboo",
   last_name: "Lab",
   password: "vise nije adminadmin",
   superadmin: true,
   email: "contact@bamboolab.eu")

 ContactInfo.create(name: "BambooLab",
 	address: "Ul. Josipa Jurja Strossmayera 341, 31000, Osijek",
 	email: "contact@bamboolab.eu")

 HomeStaticText.create(title: "Prvi korak ka kulturi!",
 	static_text: "Multifunkcionalna dvorana za koncerte, ali i predstave
 	od čak 400 mjesta te veliki izložbeno-galerijski prostori za brojna
 	kulturno umjetnička društva koji će svoj kreativni potencijal i talent
 	prikazati u prostoru kakvog uistinu zaslužuju")

SocialNetwork.delete_all
SocialNetwork.create!(name: "Facebook",
	favicon: File.open(Rails.root + "app/assets/images/icons/facebook.png"),
  	url: "https://facebook.com")

SocialNetwork.create!(name: "Twitter",
	favicon: File.open(Rails.root + "app/assets/images/icons/twitter.png"),
  	url: "https://twitter.com")


SocialNetwork.create!(name: "Instagram",
	favicon: File.open(Rails.root + "app/assets/images/icons/instagram.png"),
  	url: "https://instagram.com")

SocialNetwork.create!(name: "Youtube",
	favicon: File.open(Rails.root + "app/assets/images/icons/youtube.png"),
  	url: "https://youtube.com")

puts "Adding publish dates to news"
NewsArticle.all.each do |news|
	if news.publish_date == nil 
		news.publish_date = Date.today.strftime("%d.%m.%Y")
		puts("Date added for #{news.headline}: " + news.publish_date.strftime("%d.%m.%Y"))
		news.save!
	end
end

 AboutUs.create(title: "Kratka crtica o nama",
   static_body: "Pred budućim je manadžmentom i osnivačem još jedan
     veliki logistički zadatak. Objekt Kulturnog centra u
     relativno je visokom stupnju dovršenosti.

     Neupućene bi mogao doduše zavarati, baš kao i kod
     tornjeva, završen eksterijer, no u unutrašnjosti svi su
     zidovi još goli. Prostor KCO-a sadrži dva izložbena
     prostora, multimedijalni centar, prostore za rad
     kultuno-umjetničkih društava te i ono najvažnije -
     koncertno-kazališnu dvoranu s približno 400 mjesta.
     Ondje je planirano ugraditi posebnu propadajuću
     pozornicu koja bi bila funkcionalna za kazališne i druge
     izvedbe, a planirana je i kupnja koncertnog klavira. S
     takvim sadržajima ova će lokacija doista imati ulogu
     novog središnjeg kulturnog mjesta Osijeka. Njezino se
     uređenje planira realizirati projektima iz dostupnih EU
     fondova, a planiran je iznos od 6,5 milijuna kuna.")

 Team.create(name: "Ivan Kristijan Majić", 
   bio: "Osmislio je ove godine osvijetljene
     zgrade u Tvrđi za trajanja
     manifestacije HeadOnEast u
     sklopu Dana hrvatskog turizma, a
     čime je, javnost ocjenjuje,
     podignuta letvica u organizaciji
     događanja u Osijeku.

     Nema gotovo jedne osobe iz
     Osijeka koja nije ostala
     oduševljena osvjetljenjem zgrada
     u Tvrđi, isto fotografirala i
     podijelila na društvenim mrežama.",
   role: "Direktor",
   remote_image_url: "https://i.picsum.photos/id/#{rand(12..200)}/400/800.jpg")

# Venue.create(name: "Amfiteatar", 
#   description: "Multifunkcionalna dvorana za koncerte, ali i predstave
#     od čak 400 mjesta te veliki izložbeno-galerijski prostori za brojna
#     kulturno umjetnička društva koji će svoj kreativni potencijal i talent
#     prikazati u prostoru kakvog uistinu zaslužuju",
#   remote_image_url: "https://i.picsum.photos/id/#{rand(12..200)}/200/400.jpg")

# Venue.create(name: "Dvorana A", 
#   description: Faker::Lorem.paragraph + Faker::Lorem.paragraph,
#   remote_image_url: "https://i.picsum.photos/id/#{rand(12..200)}/200/400.jpg")

# Venue.create(name: "Galerija", 
#   description: Faker::Lorem.paragraph + Faker::Lorem.paragraph,
#   remote_image_url: "https://i.picsum.photos/id/#{rand(12..200)}/200/400.jpg")

# rand(2..5).times do |idx|
#   Venue.first.capacity_venues.create(name: ["VIP", "Bazen", "Parter", "Terasa", "Backstage"][idx], capacity: rand(50..250))
# end

# rand(2..5).times do |idx|
#   Venue.second.capacity_venues.create(name: ["VIP", "Bazen", "Parter", "Terasa", "Backstage"][idx], capacity: rand(50..250))
# end

# rand(2..5).times do |idx|
#   Venue.third.capacity_venues.create(name: ["VIP", "Bazen", "Parter", "Terasa", "Backstage"][idx], capacity: rand(50..250))
# end

# 12.times do |idx|
#   PublicProcurement.create(title: "#{idx+1}. PDF dokument", 
#     link: "neki-file.pdf", year: rand(2018..2022))
# end

# 6.times do |idx|
#   body = Faker::Lorem.paragraph + Faker::Lorem.paragraph + "#{["#KCOS ", "#Kazalište_2020 ", "#Kiparstvo ", "#Osijek ", " ", " ", " "].sample}" + Faker::Lorem.paragraph
#   short = Faker::Lorem.paragraph
#   title = "[#{idx+1}. event ]" + Faker::Book.title 
#   first_date = Faker::Time.between( from: DateTime.now + 20, to: DateTime.now + 60)
#   second_date = Faker::Time.between( from: DateTime.now + 20, to: DateTime.now + 60)
#   (first_date, second_date = second_date, first_date) if second_date < first_date
#   slug = title.parameterize
#   Event.create(text: body, brief: short, headline: title, start_date: first_date, end_date: second_date, event_type: "Umjetnost", starred: false, slug: slug) if idx.odd? 
#   Event.create(text: body, brief: short, headline: title, start_date: first_date, end_date: second_date, event_type: "Glazba", starred: true, slug: slug) if idx.even?

#   body = Faker::Lorem.paragraph + Faker::Lorem.paragraph + "#{["#KCOS ", "#Kino_2020 ", "#Pjesma ", "#Osijek ", " ", " "].sample}" + Faker::Lorem.paragraph
#   title = "[#{idx+1}. novost ]" + Faker::Book.title
#   slug = title.parameterize
#   short = Faker::Lorem.paragraph
#   NewsArticle.create(text: body, brief: short, headline: title, news_type: "Natječaj", starred: false, slug: slug) if idx.odd? 
#   NewsArticle.create(text: body, brief: short, headline: title, news_type: "Izložba", starred: true, slug: slug) if idx.even? 
# end

PostCategory.create(name: "Umjetnost")
PostCategory.create(name: "Glazba")
PostCategory.create(name: "Natječaj")
PostCategory.create(name: "Izložba")

