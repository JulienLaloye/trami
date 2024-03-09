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

Report.destroy_all
Review.destroy_all
Appointment.destroy_all
Room.destroy_all
User.destroy_all
Activity.destroy_all
Mood.destroy_all
Avatar.destroy_all
Ranking.destroy_all

city = ["Berlin", "London", "Amsterdam", "Paris", "Tokyo"]
languages = ["fr", "en", "ger"]
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

puts "Seeding moods"
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

puts "Seeding activities "
activities.each do |a|
  activity = Activity.new(
    title: a[:activity],
    mood: Mood.find_by(name: a[:mood]),
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
  { ranking: 'Trami Wanderer', threshold: 10, level: 1 },
  { ranking: 'Trami Insider', threshold: 20, level: 2 },
  { ranking: 'Trami Ace', threshold: 30, level: 3 },
  { ranking: 'Trami Expert', threshold: 40, level: 4 }
]

rankings.each do |r|
  ranking = Ranking.new(
    name: r[:ranking],
    threshold: r[:threshold],
    picture: "ok",
    description: "ok",
    level: r[:level]
  )
  ranking.save!
  print "."
end

#seed the users:
200.times do
  user = User.new(
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    nationality: Faker::Nation.nationality,
    address: city.sample,
    password: "1234567",
    description: "blablablabalbalbalablabalbalabla",
    gender: gender.sample,
    birthdate: Faker::Date.between(from: '1945-01-01', to: 18.years.ago),
    ranking: Ranking.all.sample,
    mood: Mood.all.sample,
    avatar: Avatar.all.sample
  )
  user.save!
end

#seeding the rooms:
titles = [
  { activity: 'Outdoor movie night with a projector', titles: ['Cinema Under the Stars', 'Al Fresco Film Experience', 'Open-Air Movie Night', 'Moonlit Movie Magic', 'Starry Screen Soiree'] },
  { activity: 'Dream journaling and doodling', titles: ['Imagination Unleashed Workshop', 'Creative Dreamscapes Session', 'Fantasy Art Expression', 'Dream Diary Artistry', 'Doodle Dreamworld Workshop'] },

  { activity: 'High-intensity interval training (HIIT) session', titles: ['Power Boost Workout', 'Intense Fitness Challenge', 'Extreme Cardio Blast', 'HIIT Havoc Session', 'Adrenaline Pumping Exercise'] },
  { activity: 'Salsa dance class', titles: ['Latin Dance Fiesta', 'Rhythmic Salsa Workshop', 'Passionate Dance Moves Class', 'Salsa Sensation Choreography', 'Dance Floor Heatwave Class'] },

  { activity: 'Guided nature meditation', titles: ['Serene Nature Connection', 'Mindfulness in the Wilderness', 'Tranquil Forest Meditation', 'Guided Eco-Mindfulness', "Nature's Calm Embrace Session"] },
  { activity: 'Reading a book in a hammock', titles: ['Hammock Reading Retreat', 'Literary Escape Lounge', 'Relaxing Book Nook', 'Hammock Haven Reading', 'Bookish Bliss in the Breeze'] },

  { activity: 'Exploring a new cozy cafe with a book', titles: ['Cafe Discovery and Book Delight', 'Literary Cafe Tour', "Bookworm's Hidden Gems", 'Culinary Reading Adventure', 'Cozy Cafe Book Excursion'] },
  { activity: 'Day trip to a nearby historical town', titles: ['Historical Town Excursion', 'Local Heritage Adventure', 'Time Travel Day Trip', 'Historic Hamlet Exploration', 'Quaint Town Time Capsule'] },

  { activity: 'Empowerment workshop for women', titles: ["Women's Empowerment Symposium", 'Sisterhood Strength Workshop', 'Fierce Females Forum', 'EmpowerHer Collective Session', 'Women Rising Workshop'] },
  { activity: 'Cultural exchange potluck', titles: ['Global Tastes Gathering', 'International Cuisine Exchange', 'Potluck Cultural Fusion', 'Culinary Diversity Banquet', 'Multicultural Dish Exchange'] },

  { activity: 'Virtual reality gaming night', titles: ['VR Gaming Extravaganza', 'Immersive Gaming Experience', 'Digital Reality Battle Night', 'Virtual Adventure Showdown', 'Gaming Galaxy Quest'] },
  { activity: 'Group karaoke battle', titles: ['Karaoke Showdown Spectacle', 'Sing-Off Championship', 'Harmony War: Battle of the Voices', 'Group Vocal Clash', 'Melodic Showdown Extravaganza'] },

  { activity: 'Nighttime forest hike with lanterns', titles: ['Enchanted Forest Night Trek', 'Moonlit Woods Expedition', 'Lantern-lit Nature Quest', 'Nocturnal Nature Excursion', 'Guided Moonlight Hike'] },
  { activity: 'Snorkeling adventure in a coral reef', titles: ['Underwater Wonderland Expedition', 'Coral Paradise Snorkel', 'Tropical Reef Exploration', 'Oceanic Oasis Discovery', 'Aquatic Adventure Snorkel'] },

  { activity: 'Chill acoustic live music at a lounge', titles: ['Acoustic Serenade Soiree', 'Soothing Lounge Melodies', 'Mellow Music Vibes Night', 'Live Acoustic Harmony', 'Lounge Concert Atmosphere'] },
  { activity: 'Wine and tapas tasting evening', titles: ['Wine & Tapas Delight Night', 'Gourmet Pairing Extravaganza', 'Epicurean Tasting Affair', 'Culinary Elegance Showcase', 'Vineyard & Tapas Culmination'] },

  { activity: 'Pottery and sculpting workshop', titles: ['Artistic Clay Creations Class', 'Sculpture Craftsmanship Workshop', 'Hands-on Pottery Mastery', 'Creative Ceramics Session', 'Clay Sculpture Artistry'] },
  { activity: 'Storytelling and creative writing class', titles: ['Narrative Craftsmanship Workshop', 'Creative Writing Odyssey', 'Tale Weaving Seminar', 'Fiction Writing Mastery', 'Storytelling Creativity Intensive'] },

  { activity: 'Science fiction book discussion group', titles: ['Sci-Fi Chronicles Symposium', 'Futuristic Fiction Forum', 'Interstellar Imagination Circle', 'Galactic Book Exploration', 'Sci-Fi Literary Universe'] },
  { activity: 'Modern art exhibition visit', titles: ['Contemporary Art Exploration', 'Avant-Garde Gallery Tour', 'Abstract Expressionism Showcase', 'Modern Art Appreciation', 'Gallery Immersion Experience'] },

  { activity: 'Exploring hidden gems in the city', titles: ['Urban Adventure Quest', 'City Secrets Discovery Tour', 'Metropolis Marvels Exploration', 'Hidden Gem City Safari', 'Secret Spots Urban Expedition'] },
  { activity: 'Solo backpacking adventure in Asia', titles: ['Independent Explorer Expedition', 'Solo Asian Odyssey', "Backpacker's Solo Journey", 'Asia Exploration Solo Trek', 'Adventure Solo Backpacking Quest'] },

  { activity: 'Mindful walking meditation in a botanical garden', titles: ['Botanical Bliss Meditation Walk', 'Nature Mindfulness Stroll', 'Zen Garden Walking Session', 'Mindful Botanic Meditation', 'Guided Nature Awareness Walk'] },
  { activity: 'Mindful breathing workshop', titles: ['Breath of Serenity Seminar', 'Mindful Respiratory Retreat', 'Conscious Breathing Workshop', 'Zen Breath Awareness Session', 'Mindful Breathing Mastery Class'] },
]

gender_options = ["men", "women", "no preference"]

Activity.all.each do |activity|
  (0..5).to_a.sample.times do
    activity_title = activity.title
    title_array = []
    titles.each do |t|
      title_array = t[:titles] if t[:activity] == activity_title
    end
    title = title_array.sample
    min = (2..5).to_a.sample
    user = User.all.sample
    date = Faker::Date.between(from: 1.years.ago, to: 1.years.since)
    min_age = (18..50).to_a.sample
    room = Room.new(
      title: title,
      description: activity.category,
      gender: gender_options.sample,
      date: date,
      min_part: min,
      max_part: min + (0...10).to_a.sample,
      address: city.sample,
      language: languages.sample,
      activity: activity,
      user: user,
      finished: date > Date.today ? false : true, #how to do it constantly in the code?
      min_age: min_age,
      max_age: min_age + (1..15).to_a.sample,
      participants: 1
    )
    room.save!
  end
end
puts "Rooms seeded"
#seed the appointments
puts "_______________________"
Room.all.each do |room|
  creator = room.user
  counter = 0
  age_rank = (room.min_age..room.max_age).to_a
  user_total = User.all.to_a.select { |user| age_rank.include?((Date.today - user.birthdate).to_i / 365) }
  user_total.reject { |user| user == creator }
  Appointment.create(user: creator, room: room, ownership: true, status: 1)
  if user_total.size > 1
    (1..(room.max_part - 1)).to_a.sample.times do
      participant = user_total.sample
      status = [0, 1].sample
      appointment = Appointment.new(user: participant, room: room, ownership: false, status: status)
      appointment.save!
      user_total = user_total.reject { |user| user == participant } if user_total.size > 1
      counter += 1 if status == 1
    end
  end
  room.participants += counter
  room.save!
end
puts "Appointments seeded"
puts "_______________________"
#seed the reviews:
adjectives = [
  'kind',
  'compassionate',
  'empathetic',
  'friendly',
  'enthusiastic',
  'creative',
  'intelligent',
  'helpful',
  'positive',
  'adaptable',
  'courteous',
  'resilient',
  'patient',
  'considerate',
  'thoughtful',
  'inspiring',
  'motivated',
  'collaborative',
  'generous',
  'uplifting',
  'reliable',
  'trustworthy',
  'respectful',
  'honest',
  'optimistic',
  'hardworking',
  'dedicated',
  'sincere',
  'insightful',
  'supportive',
  'communicative',
  'resourceful',
  'innovative',
  'perseverant',
  'friendly',
  'joyful',
  'polite',
  'grateful',
  'enthusiastic',
  'energetic',
  'fun-loving',
  'open-minded'
]

Room.all.select { |room| room.finished == true }.each do |room|
  users = []
  room.appointments.each do |appointment|
    users << appointment.user
  end
  room.appointments.each do |appointment|
    (0..1).to_a.sample.times do
      reject = users.reject { |user| user == appointment.user }
      user = reject.sample
      feedbacks = []
      list = adjectives
      (3..6).to_a.sample.times do
        feedback = list.sample
        feedbacks << feedback
        list = list.reject { |w| w == feedback }
      end
      Review.create(appointment: appointment, user: user, feedbacks: feedbacks )
      users = users.reject { |u| u == user }
    end
  end
end


puts "Reviews seeded"
puts "Updating the users'rank"

User.all.each do |user|
  reviews = user.appointments.size
  if reviews < Ranking.where(level: 1).last.threshold
    user.ranking = Ranking.where(level: 1).last
  elsif reviews >= Ranking.where(level: 1).last.threshold && reviews < Ranking.where(level: 2).last.threshold
    user.ranking = Ranking.where(level: 2).last
  elsif reviews >= Ranking.where(level: 2).last.threshold && reviews < Ranking.where(level: 3).last.threshold
    user.ranking = Ranking.where(level: 3).last
  elsif reviews >= Ranking.where(level: 3).last.threshold
    user.ranking = Ranking.where(level: 4).last
  end
  user.save!
end
