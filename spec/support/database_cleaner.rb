RSpec.configure do |config|
  EXCEPT_TRUNCATE_TABLE = %w[
    nationals
    cities
    districts
    ingredients
    medecines
    individuals
    organizations
    users
    user_tokens
  ].freeze

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation, { except: EXCEPT_TRUNCATE_TABLE })
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
