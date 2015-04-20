class Seed
  def self.start
    seed = new
    seed.create_users
    seed.create_accounts
  end

  def create_users
    10.times do
      User.create(
        name:  Faker::Name.name,
        email: Faker::Internet.email
      )
    end
  end

  def create_accounts
    10.times do |i|
      Account.create(
        amount: rand(0..100000),
        user_id: i + 1
      )
    end
  end
end

Seed.start
