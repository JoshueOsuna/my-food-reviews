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

  restaurant = Restaurant.create([
    { 
      name: "Panchito Mexican Restaurant",
      image_url: "https://images.sirved.com/ChIJ3bn8I5TfmoAREocIXO1HJeA/lAcWC8spGE.png"
    }, 
    { 
      name: "Bullta K-BBQ & Bar",
      image_url: "https://static.wixstatic.com/media/2f17cd_0e891d3732cb446bacf2dc0bfe037856~mv2.jpg/v1/fill/w_337,h_424,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/2f17cd_0e891d3732cb446bacf2dc0bfe037856~mv2.jpg"
    },
    { 
      name: "In-N-Out",
      image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/InNOut_2021_logo.svg/1200px-InNOut_2021_logo.svg.png" 
    }, 
    { 
      name: "Blue Nami",
      image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ1tML-zz39Pv1k8RMIqu6br0ui_6eZN-veZAz3JxVkvNpO2k0vEsv7u_BCho8g7qTBkg&usqp=CAU"
    }, 
    { 
      name: "Kiki's Chicken",
      image_url: "https://images.getbento.com/accounts/235a1af919994b8094d8f0d908603737/media/images/61058logo.png?w=600&fit=max&auto=compress,format&h=600" 
    }, 
    { 
      name: "Pete's Restaurant and Brewhouse",
      image_url: "https://static.wixstatic.com/media/858509_4a4ddf12a14a4300a2cb8d594a7c1f98~mv2.png" 
    }
  ])

  reviews = Review.create ([
    {
        title: 'Daniel Cooper',
        description: 'Solid burrito, salsa bar was also pretty good. I’d definitely eat here again. Very good service and friendly staff.',
        score: 5,
        restaurant: restaurant.first
    },
    {
        title: 'David Brotman',
        description: 'Really impressed with this place. Sat down and within a couple minutes the waitress brought over still hot freshly made tortilla chips along with a steaming side of hot bean dip. A few minutes after that my chicken burrito arrived. This was a massive sized meal that included all the extras included -  pico de gallo, shredded cabbage, cilantro. The meat was cooked just right, not too salty nor dry with a generous helping of rice and beans. It took quite a while to finish this monster sized portion. Total cost including a jamaica drink came to $13.',
        score: 5,
        restaurant: restaurant.first
    },
    {
        title: 'Matt Michalek',
        description: 'This is the best Mexican food I’ve ever had. The tacos were incredible and especially with the Wednesday special (3 for $7). Super fresh food and amazing salsa/sauces. Also the owner (?) was so so nice and helpful. If I lived in the area I would each here everyday.',
        score: 5,
        restaurant: restaurant.first
    },
    {
        title: 'Juanitta Palomarez',
        description: 'Good just like my grandma used to make. Caritas, shrimp, and asada so flavorful. Customer service was amazing. Burrito bowl chef kissd',
        score: 5,
        restaurant: restaurant.first
    },
    {
        title: 'Mitzi Brown',
        description: 'Omg the food here is AMAZING! I got a bite to eat here with my family while we were waiting for our laundry to finish next door. The food is on point and the customer service was excellent. The owner was super nice and even hooked up my baby with some sweet potato fries to take home. Will definitely hit this place up again.',
        score: 5,
        restaurant: restaurant.first
    },
    {
        title: 'Sam A',
        description: 'They have the best micheladas! The service was phenomenal. We also had their enchiladas and aguachile and those were absolutely delicious! Definitely best Mexican food spot in all of Sacramento. I HIGHLY recommend this place.
        Kid-friendliness: They had lollipops and lids with straws for the drinks. They also had a very clean high chair. Parking: Plenty of parking',
        score: 5,
        restaurant: restaurant.first
    },
    {
        title: 'Brenda Riffe',
        description: "'If you want to eat some Mexican food that makes your taste buds and your tummy happy, and tastes like it was cooked at home with love, then you gotta have Panchito's! Jose is great and loves what he does. The family taco meal cant be beat! Try it once and you'll go back again and again!",
        score: 5,
        restaurant: restaurant.first
    },
    {
        title: 'Mitsu',
        description: 'Best chicken tostada in town! Homemade bowl was freshly fried and crispy.  Chicken was tender.  It was big enough for two servings, still under $10',
        score: 5,
        restaurant: restaurant.first
    },
    {
        title: 'Amanda Hodnett',
        description: "The food is always delicious and they treat their customers like family. I always try to order something new because I'm never disappointed. This time I got a sope which was amazing! I love the ceviche and street tacos. Best local Mexican food in the area!",
        score: 5,
        restaurant: restaurant.first
    },
    {
        title: 'Anastasiya Lyashenko',
        description: 'If I could give more than 5 stars I would! So glad we stopped by and enjoyed some Mexican food here , it quickly became a major favorite ! We will be coming back, if not daily .. then weekly ! We had the three taco special , Alpastor , barbazoa, carne asada! Home run ! Also the salsa alone is worth the trip, each one is literally perfection ! Thank you for the great service, can’t wait to be back!',
        score: 5,
        restaurant: restaurant.first
    }
  ])

  Restaurant.all[1..-1].each do |restaurant|
    10.times do
      restaurant.reviews.create(
      title: Faker::Name.name,
      description: Faker::Restaurant.review,
      score: rand(3..5),
      )
    end
  end
end
