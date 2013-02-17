namespace :db do
  desc 'Fill database with artwork'
  task populate: :environment do
    Artwork.create!(image_url: 'bag.jpg',
                    name: 'Bag of Bags',
                    description: 'A bag of rich bags.')
    20.times do |n|
      image_url = 'bag#{n+1}.jpg'
      name = Faker::Name.name
      description = 'A bag of rich bags.'
      Artwork.create!(image_url: image_url,
                      name: name,
                      description: description)
    end
  end

  desc 'Add a sample artist to the database'
  task populate_artist: :environment do
    Artist.create!(name: 'Grangy Bears',
                   email: 'grangy@grangy.com',
                   photo_url: 'grangy.jpg',
                   bio:   'I\'m an artist that loves bags.',
                   password: 'iam2bearSk!n')
  end 
end
