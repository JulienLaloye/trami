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
Message.destroy_all
Chatroom.destroy_all
Room.destroy_all
User.destroy_all
Activity.destroy_all
Mood.destroy_all
Avatar.destroy_all
Ranking.destroy_all

city = ["Berlin", "London", "Amsterdam", "Paris", "Tokyo"]
languages = ["fr", "en", "ger"]
gender = ["male", "female", "non-binary", "other"]
local_traveller = ["local", "traveller"]

#seed the moods:
moods = [
  { name: 'dreamy', type: 'Imagination', description: 'Activities that spark creativity and fantasy.', color: "#EEE1FF" },
  { name: 'energetic', type: 'Physical', description: 'Activities that involve movement and high energy.', color:  "#FFF5BF"},
  { name: 'relax', type: 'Calmness', description: 'Activities focused on relaxation and tranquility.', color: "#E7FFC0" },
  { name: 'neutral', type: 'Balanced', description: 'Activities with a neutral and calm atmosphere.', color: "#F7F1E6" },
  { name: 'social', type: 'Interaction', description: 'Activities involving social gatherings and connections.', color: "#FFE6C1" },
  { name: 'competitive', type: 'Challenge', description: 'Competitive activities that engage and excite.', color: "#FFD4D4" },
  { name: 'adventurous', type: 'Exploration', description: 'Activities that push boundaries and explore new things.', color: "#CDFFF0" },
  { name: 'chillin', type: 'Laid-back', description: 'Easygoing activities for a relaxed mood.', color: "#CDFBFF" },
  { name: 'creative', type: 'Artistic', description: 'Creative activities to express and inspire.', color: "#FFE2EF" },
  { name: 'intellectual', type: 'Thoughtful', description: 'Activities that stimulate the mind and intellect.', color: "#E3DEEF" },
  { name: 'exploratory', type: 'Discovery', description: 'Exploratory activities to learn and experience.', color: "#C9FFC0" },
  { name: 'mindful', type: 'Mindfulness', description: 'Activities focused on being present and aware.', color: "#FEFFDA" }
]

puts "Seeding moods"
moods.each do |mood|
  m = Mood.new(
    name: mood[:name],
    category: mood[:type],
    description: mood[:description],
    picture: "empty",
    color: mood[:color]
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

demo_day = Activity.new(
  title: "Coding event",
  mood: Mood.find_by(name: "intellectual"),
  category: "networking",
  interests: ["coding", "startups", "computers"]
)
demo_day.save!

wine_tasting = Activity.new(
  title: "Wine tasting",
  mood: Mood.find_by(name: "social"),
  category: "discovery",
  interests: ["wine", "alcohol", "bottles"]
)

wine_tasting.save!

clubbing = Activity.new(
  title: "Clubbing",
  mood: Mood.find_by(name: "energetic"),
  category: "night-out",
  interests: ["music", "noise", "bass"]
)

clubbing.save!

diner = Activity.new(
  title: "Diner out",
  mood: Mood.find_by(name: "social"),
  category: "food",
  interests: ["food", "discussion"]
)

diner.save!

bowling = Activity.new(
  title: "Bowling",
  mood: Mood.find_by(name: "competitive"),
  category: "sport",
  interests: ["balls", "sport"]
)
bowling.save!

museum = Activity.new(
  title: "Museum",
  mood: Mood.find_by(name: "intellectual"),
  category: "culture",
  interests: ["paintings", "history"]
)
museum.save!

group_study = Activity.new(
  title: "Group study",
  mood: Mood.find_by(name: "intellectual"),
  category: "studying",
  interests: ["studying"]
)

group_study.save!

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
  { personality: 'Friendly', picture: 'friendly.jpeg', description: 'Always ready to make new friends and create a warm atmosphere.' },
  { personality: 'Energetic', picture: 'energetic.jpeg', description: 'Full of vitality and enthusiasm, bringing energy to any situation.' },
  { personality: 'Calm', picture: 'calm.jpeg', description: 'Maintains a serene and composed demeanor, even in challenging moments.' },
  { personality: 'Optimistic', picture: 'optimistic.jpeg', description: 'Sees the bright side of life and remains positive in all situations.' },
  { personality: 'Social', picture: 'social.jpeg', description: 'Enjoys connecting with others and being part of social gatherings.' },
  { personality: 'Ambitious', picture: 'ambitious.jpeg', description: 'Sets high goals and works hard to achieve success and growth.' },
  { personality: 'Adventurous', picture: 'adventurous.jpeg', description: 'Thrives on exploring new territories and taking risks.' },
  { personality: 'Easygoing', picture: 'easygoing.jpeg', description: 'Laid-back and relaxed, going with the flow of life.' },
  { personality: 'Creative', picture: 'creative.jpeg', description: 'Expressive and imaginative, finding inspiration in every moment.' },
  { personality: 'Intellectual', picture: 'intellectual.jpeg', description: 'Loves to engage in deep thoughts and intellectual discussions.' },
  { personality: 'Curious', picture: 'curious.jpeg', description: 'Constantly seeking knowledge and curious about the world.' },
  { personality: 'Mindful', picture: 'mindful.jpeg', description: 'Practices mindfulness and stays present in the moment.' },
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

puts Faker::Date.between(from: '1945-01-01', to: 20.years.ago)
usernames = []
c = 0
#seed the users:
julien = User.new(
  username: "julien_lw",
  email: "julien@julien.julien",
  nationality: "french",
  address: "Paris",
  password: "1234567",
  description: "I'm a loyal companion, his unwavering support and genuine kindness making me a trusted confidant to all who know me!",
  gender: "male",
  birthdate: "19/02/1996",
  ranking: Ranking.all.sample,
  mood: Mood.all.sample,
  avatar: Avatar.all.sample,
  status: "traveller"
)

julien.save!

thu = User.new(
  username: "thu_lw",
  email: "thu@thu.thu",
  nationality: "german",
  address: "Berlin",
  password: "1234567",
  description: "I am a charming conversationalist, with a quick wit and a penchant for making everyone feel at ease!!",
  gender: "female",
  birthdate: "10/04/1993",
  ranking: Ranking.all.sample,
  mood: Mood.all.sample,
  avatar: Avatar.all.sample,
  status: "local"
)

thu.save!

bhawana = User.new(
  username: "bhawana_lw",
  email: "bs@bs.com",
  nationality: "indian",
  address: "Berlin",
  password: "1234567",
  description: "I'm an empathetic listener, always ready to offer a comforting shoulder and wise advice to my friends",
  gender: "male",
  birthdate: "21/09/1994",
  ranking: Ranking.all.sample,
  mood: Mood.all.sample,
  avatar: Avatar.all.sample,
  status: "local"
)
bhawana.save!

jerry = User.new(
  username: "jerry_lw",
  email: "jerry@jerry.jerry",
  nationality: "thai",
  address: "Berlin",
  password: "1234567",
  description: "I'm always ready to bring joy to any gathering with my infectious laughter and positive energy!",
  gender: "female",
  birthdate: "10/12/1998",
  ranking: Ranking.all.sample,
  mood: Mood.all.sample,
  avatar: Avatar.all.sample,
  status: "traveller"
)

jerry.save!

200.times do
  username = Faker::Name.first_name
  c += 1
  username = "#{username}#{c}" if usernames.include?(username)
  user = User.new(
    username: username,
    email: Faker::Internet.email,
    nationality: Faker::Nation.nationality,
    address: city.sample,
    password: "1234567",
    description: "blablablabalbalbalablabalbalabla",
    gender: gender.sample,
    birthdate: Faker::Date.between(from: '1945-01-01', to: 20.years.ago),
    ranking: Ranking.all.sample,
    mood: Mood.all.sample,
    avatar: Avatar.all.sample,
    status: local_traveller.sample
  )
  usernames << username
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

le_wagon = Room.new(
  title: "Le Wagon Demo Day",
  description: "Part time batch demo-day without Ivan",
  gender: "no preference",
  date: "23/03/2024",
  min_part: 4,
  max_part: 34,
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  language: "en",
  activity: demo_day,
  user: julien,
  finished: false, #how to do it constantly in the code?
  min_age: 18,
  max_age: 99,
  participants: 3
)

le_wagon.save!
Chatroom.create!(
  room: le_wagon
)

Appointment.create!(user: thu, room: le_wagon, ownership: false, status: 1)
Appointment.create!(user: jerry, room: le_wagon, ownership: false, status: 1)

amazing_german_tasting = Room.new(
  title: "Amazing German Wine Tasting",
  description: "Have a nice glass with me! With an amazing wine selection! Amazing!",
  gender: "no preference",
  date: "24/03/2024",
  min_part: 2,
  max_part: 5,
  address: "Taubenstraße 20, 10117 Berlin",
  language: "ger",
  activity: wine_tasting,
  user: julien,
  finished: false,
  min_age: 20,
  max_age: 35,
  participants: 1
)

amazing_german_tasting.save!
Chatroom.create!(
  room: amazing_german_tasting
)

bowling_competition = Room.new(
  title: "Bowling Competition",
  description: "Competition of bowling, everyone is welcome, the level is high, we are ready, you can win cash",
  gender: "no preference",
  date: "25/03/2024",
  min_part: 5,
  max_part: 10,
  address: "Taubenstraße 20, 10117 Berlin",
  language: "en",
  activity: bowling,
  user: jerry,
  finished: false,
  min_age: 25,
  max_age: 60,
  participants: 1
)

bowling_competition.save!
Chatroom.create!(
  room: bowling_competition
)

berghain_queuying = Room.new(
  title: "Berghain queuing",
  description: "Let's all go at once at the doors, they have to let us in!",
  gender: "no preference",
  date: "23/03/2024",
  min_part: 5,
  max_part: 20,
  address: "Am Wriezener bhf, 10243 Berlin",
  language: "en",
  activity: clubbing,
  user: bhawana,
  finished: false,
  min_age: 25,
  max_age: 60,
  participants: 1
)

berghain_queuying.save!
Chatroom.create!(
  room: berghain_queuying
)

mac_do = Room.new(
  title: "Dinner Night!!",
  description: "Let s have a dinner in this fine restaurant of good meet and social-care.",
  gender: "women",
  date: "23/03/2024",
  min_part: 3,
  max_part: 7,
  address: "Friedrichstraße 141-142, 10117 Berlin",
  language: "en",
  activity: diner,
  user: User.all.sample,
  finished: false,
  min_age: 25,
  max_age: 60,
  participants: 1
)

mac_do.save!
Chatroom.create!(
  room: mac_do
)

studying_together = Room.new(
  title: "Study session together!!!",
  description: "Hey girlssss!! Would love to study with other people! Gen Z goes first, XOXO",
  gender: "women",
  date: "23/03/2024",
  min_part: 3,
  max_part: 9,
  address: "Dudenstraße 18-20, 10965 Berlin",
  language: "en",
  activity: group_study,
  user: User.all.sample,
  finished: false,
  min_age: 18,
  max_age: 24,
  participants: 1
)

studying_together.save!
Chatroom.create!(
  room: studying_together
)

museum_visit = Room.new(
  title: "BODE MUSEUM: SATURDAY 14HR".capitalize,
  description: "I would like to invite you to visit the museum with me, best regards, SEBASTIAN.",
  gender: "men",
  date: "23/03/2024",
  min_part: 2,
  max_part: 4,
  address: "Am Kupfergraben, 10178 Berlin",
  language: "en",
  activity: museum,
  user: User.all.sample,
  finished: false,
  min_age: 60,
  max_age: 70,
  participants: 1
)

museum_visit.save!
Chatroom.create!(
  room: museum_visit
)

Activity.all.reject { |activity| ["Coding event","Group study","Wine tasting", "Clubbing", "Diner out", "Bowling", "Museum" ].include?(activity.title)}.each do |activity|
  rand(1..5).times do
    activity_title = activity.title
    title_array = []
    titles.each do |t|
      title_array = t[:titles] if t[:activity] == activity_title
    end
    title = title_array.sample
    min = rand(2..5)
    user = User.all.sample
    date = Faker::Date.between(from: 1.years.ago, to: 1.years.since)
    min_age = rand(18..50)
    room = Room.new(
      title: title,
      description: activity.category,
      gender: Room::GENDER_OPTIONS.sample,
      date: date,
      min_part: min,
      max_part: min + rand(1..9),
      address: city.sample,
      language: languages.sample,
      activity: activity,
      user: user,
      finished: date > Date.today ? false : true, #how to do it constantly in the code?
      min_age: min_age,
      max_age: min_age + rand(1..15),
      participants: 1
    )
    room.save!
    chatroom = Chatroom.new(
      room: room
    )
    chatroom.save!
  end
end
puts "Rooms seeded"
#seed the appointments
puts "_______________________"

Room.all.each do |room|
  creator = room.user
  participants = 0
  Appointment.create!(user: creator, room: room, ownership: true, status: 1)

  # Determine the number of additional participants to add
  additional_participants_count = (1..(room.max_part - 1)).to_a.sample
  possible_participants = User.where.not(id: creator.id) # Exclude the room creator

  additional_participants_count.times do
    participant = possible_participants.sample
    status = [0, 1].sample
    next unless participant # Skip if no participant is found
    # Check if an appointment already exists for this participant and room
    unless Appointment.exists?(user: participant, room: room)
      Appointment.create!(user: participant, room: room, ownership: false, status: status)
      participants += 1 if status == 1
    end

    # Remove the selected participant from the pool to prevent duplicates
    possible_participants = possible_participants.where.not(id: participant.id)
  end
room.participants += participants
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

test_user = User.create(
  email: "thu@thu.com",
  password: "1234567",
  username: "Snorlax",
  nationality: "German",
  gender: "other",
  birthdate: Date.new(2004, 3, 9),
  description: "This is a test user named Thu.",
  address: "123 Test Address, Test City",
  interests: ["gaming", "reading", "coding"],
  mood_id: Mood.all.sample.id,
  ranking_id: Ranking.all.sample.id, # Assuming at least one Ranking exists
  avatar_id: Avatar.first.id, # Assuming at least one Avatar exists
  latitude: 50.1109,
  longitude: 8.6821
)

puts "The Coolest Test User of the World, #{test_user.username} is successfully created"

random_rooms = Room.all.sample(6)

random_rooms.each do |room|
  # Create an appointment for each of the selected rooms and the user
  Appointment.create(
    user: test_user,
    room: room,
    ownership: false,
    status: [0,1].sample,
    presence: false
  )
end

puts "Everything is working!"
