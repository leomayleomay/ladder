FactoryGirl.define do

  factory :user, :aliases => [:owner] do
    name 'Bob Bobson'
    email 'bob@bobson.com'
  end

  factory :service do
    user
    provider 'developer'
    sequence(:uid) {|n| "user_#{n}"}
    name 'Bob Bobson'
    email 'bob@bobson.com'
  end

  factory :tournament do
    owner
    sequence(:name) {|n| "Tournament #{n}"}
  end

  factory :rank do
    user
    tournament
    mu 25.0
    sigma 25.0 / 3.0
  end

  factory :elo_rating do
    user
    tournament
    pro false
    rating 1000
    games_played 0
  end

  factory :glicko2_rating, :aliases => [:rating] do
    user
    tournament
    rating Glicko2::DEFAULT_GLICKO_RATING
    rating_deviation Glicko2::DEFAULT_GLICKO_RATING_DEVIATION
    volatility Glicko2::DEFAULT_VOLATILITY
  end

  factory :invite do
    owner
    tournament
    email 'bob@bobson.com'
    sequence(:code) {|n| "code_#{n}"}
    expires_at { 1.day.from_now }
  end

  factory :game do
    tournament
  end

  factory :game_rank do
    game
    user
    sequence(:position) {|n| n}
  end

end
