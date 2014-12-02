# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :greeting do
  desc "Say Hello!"
  task (:hello) do

    puts "Hello!"
  end

  desc "Say World"
  task (:world) do
    puts "World!"
  end
end