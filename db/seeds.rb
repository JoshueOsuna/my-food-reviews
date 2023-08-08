# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ActiveRecord::Base.transaction do
  Review.destroy_all
  Restaurant.destroy_all
  10.times do
    restaurant = Restaurant.create(
      name: Faker::Restaurant.name,
      image_url: Faker::LoremFlickr.image(size: "50x60"),
    )
    100.times do
      restaurant.reviews.create(
        title: Faker::Name.name,
        description: Faker::Restaurant.review,
        score: rand(1..5),
      )
    end
   end

  # restaurant = Restaurant.create([
  #   { 
  #     name: "Panchito Mexican Restaurant",
  #     image_url: "https://images.sirved.com/ChIJ3bn8I5TfmoAREocIXO1HJeA/lAcWC8spGE.png"
  #   }, 
  #   { 
  #     name: "Bullta K-BBQ & Bar",
  #     image_url: "https://static.wixstatic.com/media/2f17cd_0e891d3732cb446bacf2dc0bfe037856~mv2.jpg/v1/fill/w_337,h_424,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/2f17cd_0e891d3732cb446bacf2dc0bfe037856~mv2.jpg"
  #   },
  #   { 
  #     name: "In-N-Out",
  #     image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/InNOut_2021_logo.svg/1200px-InNOut_2021_logo.svg.png" 
  #   }, 
  #   { 
  #     name: "Blue Nami",
  #     image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ1tML-zz39Pv1k8RMIqu6br0ui_6eZN-veZAz3JxVkvNpO2k0vEsv7u_BCho8g7qTBkg&usqp=CAU"
  #   }, 
  #   { 
  #     name: "Kiki's Chicken",
  #     image_url: "https://images.getbento.com/accounts/235a1af919994b8094d8f0d908603737/media/images/61058logo.png?w=600&fit=max&auto=compress,format&h=600" 
  #   }, 
  #   { 
  #     name: "Pete's Restaurant and Brewhouse",
  #     image_url: "https://static.wixstatic.com/media/858509_4a4ddf12a14a4300a2cb8d594a7c1f98~mv2.png" 
  #   }
  # ])

  # reviews = Review.create ([
  #   {
  #       title: 'Great place',
  #       description: 'I had a great time.',
  #       score: 5,
  #       restaurant: restaurant.first
  #   },
  #   {
  #       title: 'Good place',
  #       description: 'I had a good time.',
  #       score: 4,
  #       restaurant: restaurant.first
  #   }
  # ])
end
