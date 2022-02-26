web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq
release: bin/rails db:migrate
release: bundle exec rake db:seed
