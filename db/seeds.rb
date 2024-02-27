# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'date'

print "seeding..."

User.destroy_all
Activity.destroy_all
Mood.destroy_all
Avatar.destroy_all
Ranking.destroy_all

city = ["Berlin", "London", "Amsterdam", "Paris", "Tokyo"]
gender = ["male", "female", "non-binary", "other"]

#seed the moods:
moods = [
  { name: 'dreamy', type: 'Imagination', description: 'Activities that spark creativity and fantasy.' },
  { name: 'energetic', type: 'Physical', description: 'Activities that involve movement and high energy.' },
  { name: 'relax', type: 'Calmness', description: 'Activities focused on relaxation and tranquility.' },
  { name: 'neutral', type: 'Balanced', description: 'Activities with a neutral and calm atmosphere.' },
  { name: 'social', type: 'Interaction', description: 'Activities involving social gatherings and connections.' },
  { name: 'competitive', type: 'Challenge', description: 'Competitive activities that engage and excite.' },
  { name: 'adventurous', type: 'Exploration', description: 'Activities that push boundaries and explore new things.' },
  { name: 'chillin', type: 'Laid-back', description: 'Easygoing activities for a relaxed mood.' },
  { name: 'creative', type: 'Artistic', description: 'Creative activities to express and inspire.' },
  { name: 'intellectual', type: 'Thoughtful', description: 'Activities that stimulate the mind and intellect.' },
  { name: 'exploratory', type: 'Discovery', description: 'Exploratory activities to learn and experience.' },
  { name: 'mindful', type: 'Mindfulness', description: 'Activities focused on being present and aware.' }
]

moods.each do |mood|
  m = Mood.new(
    name: mood[:name],
    category: mood[:type],
    description: mood[:description],
    picture: "empty"
  )
  m.save!
  print "."
end

#seed the activities:
activities = [
  { mood: 'dreamy', category: 'films', activity: 'Movie night under the stars' },
  { mood: 'dreamy', category: 'creativity', activity: 'Painting and wine evening' },

  { mood: 'energetic', category: 'sports & fitness', activity: 'Group jogging in the park' },
  { mood: 'energetic', category: 'dancing', activity: 'Dance-off competition' },

  { mood: 'relax', category: 'mindful activities', activity: 'Guided meditation session' },
  { mood: 'relax', category: 'weekend activities', activity: 'Lazy Sunday brunch' },

  { mood: 'neutral', category: 'cafes', activity: 'Coffee and reading at a local cafe' },
  { mood: 'neutral', category: 'local travel', activity: 'Exploring nearby neighborhoods' },

  { mood: 'social', category: "women's social", activity: 'Girls night out' },
  { mood: 'social', category: 'international meetups', activity: 'Language exchange meetup' },

  { mood: 'competitive', category: 'games', activity: 'Board game tournament' },
  { mood: 'competitive', category: 'karaoke', activity: 'Karaoke singing contest' },

  { mood: 'adventurous', category: 'hiking', activity: 'Mountain hiking adventure' },
  { mood: 'adventurous', category: 'water activities', activity: 'Kayaking in the river' },

  { mood: 'chillin', category: 'nightlife', activity: 'Chill-out lounge with live music' },
  { mood: 'chillin', category: 'food & drinks', activity: 'Wine and cheese tasting' },

  { mood: 'creative', category: 'creativity', activity: 'DIY craft workshop' },
  { mood: 'creative', category: 'workshop activities', activity: 'Photography masterclass' },

  { mood: 'intellectual', category: 'book club', activity: 'Literary discussion group' },
  { mood: 'intellectual', category: 'museum & galleries', activity: 'Art gallery tour' },

  { mood: 'exploratory', category: 'local travel', activity: 'City exploration on foot' },
  { mood: 'exploratory', category: 'global travel', activity: 'Backpacking through Europe' },

  { mood: 'mindful', category: 'yoga', activity: 'Sunset yoga by the beach' },
  { mood: 'mindful', category: 'mindful activities', activity: 'Mindfulness retreat' },

  { mood: 'dreamy', category: 'films', activity: 'Outdoor movie night with a projector' },
  { mood: 'dreamy', category: 'creativity', activity: 'Dream journaling and doodling' },

  { mood: 'energetic', category: 'sports & fitness', activity: 'High-intensity interval training (HIIT) session' },
  { mood: 'energetic', category: 'dancing', activity: 'Salsa dance class' },

  { mood: 'relax', category: 'mindful activities', activity: 'Guided nature meditation' },
  { mood: 'relax', category: 'weekend activities', activity: 'Reading a book in a hammock' },

  { mood: 'neutral', category: 'cafes', activity: 'Exploring a new cozy cafe with a book' },
  { mood: 'neutral', category: 'local travel', activity: 'Day trip to a nearby historical town' },

  { mood: 'social', category: "women's social", activity: 'Empowerment workshop for women' },
  { mood: 'social', category: 'international meetups', activity: 'Cultural exchange potluck' },

  { mood: 'competitive', category: 'games', activity: 'Virtual reality gaming night' },
  { mood: 'competitive', category: 'karaoke', activity: 'Group karaoke battle' },

  { mood: 'adventurous', category: 'hiking', activity: 'Nighttime forest hike with lanterns' },
  { mood: 'adventurous', category: 'water activities', activity: 'Snorkeling adventure in a coral reef' },

  { mood: 'chillin', category: 'nightlife', activity: 'Chill acoustic live music at a lounge' },
  { mood: 'chillin', category: 'food & drinks', activity: 'Wine and tapas tasting evening' },

  { mood: 'creative', category: 'creativity', activity: 'Pottery and sculpting workshop' },
  { mood: 'creative', category: 'workshop activities', activity: 'Storytelling and creative writing class' },

  { mood: 'intellectual', category: 'book club', activity: 'Science fiction book discussion group' },
  { mood: 'intellectual', category: 'museum & galleries', activity: 'Modern art exhibition visit' },

  { mood: 'exploratory', category: 'local travel', activity: 'Exploring hidden gems in the city' },
  { mood: 'exploratory', category: 'global travel', activity: 'Solo backpacking adventure in Asia' },

  { mood: 'mindful', category: 'yoga', activity: 'Mindful walking meditation in a botanical garden' },
  { mood: 'mindful', category: 'mindful activities', activity: 'Mindful breathing workshop' }
]

activities.each do |a|
  activity = Activity.new(
    title: a[:activity],
    mood_id: Mood.find_by(name: a[:mood]).id,
    category: a[:category],
    interests: []
  )
  activity.save!
  print "."
end

#seed the avatars:
avatars = [
  { personality: 'Friendly', picture: '😊', description: 'Always ready to make new friends and create a warm atmosphere.' },
  { personality: 'Energetic', picture: '🌟', description: 'Full of vitality and enthusiasm, bringing energy to any situation.' },
  { personality: 'Calm', picture: '🧘‍♂️', description: 'Maintains a serene and composed demeanor, even in challenging moments.' },
  { personality: 'Optimistic', picture: '🌞', description: 'Sees the bright side of life and remains positive in all situations.' },
  { personality: 'Social', picture: '👫', description: 'Enjoys connecting with others and being part of social gatherings.' },
  { personality: 'Ambitious', picture: '💼', description: 'Sets high goals and works hard to achieve success and growth.' },
  { personality: 'Adventurous', picture: '🚀', description: 'Thrives on exploring new territories and taking risks.' },
  { personality: 'Easygoing', picture: '😎', description: 'Laid-back and relaxed, going with the flow of life.' },
  { personality: 'Creative', picture: '🎨', description: 'Expressive and imaginative, finding inspiration in every moment.' },
  { personality: 'Intellectual', picture: '📚', description: 'Loves to engage in deep thoughts and intellectual discussions.' },
  { personality: 'Curious', picture: '🔍', description: 'Constantly seeking knowledge and curious about the world.' },
  { personality: 'Mindful', picture: '🌿', description: 'Practices mindfulness and stays present in the moment.' },
]

avatars.each do |a|
  avatar = Avatar.new(
    personality: a[:personality],
    picture: a[:picture],
    description: a[:description]
  )
  avatar.save!
  print "."
end

#seed the rankings:
rankings = [
  { ranking: 'Trami Wanderer', threshold: 10 },
  { ranking: 'Trami Insider', threshold: 20 },
  { ranking: 'Trami Ace', threshold: 30 },
  { ranking: 'Trami Expert', threshold: 40 }
]

rankings.each do |r|
  ranking = Ranking.new(
    name: r[:ranking],
    threshold: r[:threshold],
    picture: "ok",
    description: "ok"
  )
  ranking.save!
  print "."
end

#seed the users:

10.times do
  user = User.new(
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    nationality: Faker::Nation.nationality,
    address: city.sample,
    password: "1234567",
    description: "blablablabalbalbalablabalbalabla",
    gender: gender.sample,
    birthdate: Faker::Date.between(from: '1940-01-01', to: 18.years.ago),
    ranking_id: Ranking.all.sample.id,
    mood_id: Mood.all.sample.id,
    avatar_id: Avatar.all.sample.id
  )
  user.save!
  print "."
end

#seed the rooms:



#seed the reviews:
