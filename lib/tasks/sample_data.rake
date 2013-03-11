namespace :db do
  desc 'Fill database with artwork'
  task populate: :environment do
    bag_of_bags = Artwork.create!(name: 'Bag of Bags',
                    description: 'A bag of rich bags.')
    bag_of_bags.image_file_name = "bag.jpg"
    bag_of_bags.save
    20.times do |n|
      image_url = "bag#{n+1}.jpg"
      name = Faker::Name.name
      description = 'A bag of rich bags.'
      current_artwork = Artwork.create!(name: name,
                        description: description)
      current_artwork.image_file_name = image_url
      current_artwork.save
    end
  end

  desc 'Add a sample artist to the database'
  task populate_artist: :environment do
    Artist.create!(id: 1,
                   name: 'Grangy Bears',
                   email: 'grangy@grangy.com',
                   photo_url: '/artist/grangy.jpg',
                   bio:   'I\'m an artist that loves bags.',
                   password: 'iam2bearSk!n',
                   site_title: 'Glittery')
  end 
end
