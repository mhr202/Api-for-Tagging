RSpec.configure do |config|
  config.before do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :truncation
    DatabaseCleaner.start
  ensure
    DatabaseCleaner.clean
  end
end
