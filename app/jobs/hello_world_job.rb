class HelloWorldJob < ApplicationJob
  def perform
    puts 'test'
  end
end