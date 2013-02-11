FactoryGirl.define do
  factory :artwork do
    image       'bags.jpg'
    name        'Bag of Bags'
    description 'A rich bag of rich, full bags.'
  end

  factory :artist do
    name  'Grangy Bears'
    email 'grangy@grangy.com'
    photo 'grangy.jpg'
    bio   'I\'m an artist that loves bags.'
  end
end
