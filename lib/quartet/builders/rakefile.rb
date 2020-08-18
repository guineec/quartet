# frozen_string_literal: true

module Quartet::Builders
  class Rakefile < Quartet::Builders::Builder
    def initialize
      @name_override = "Rakefile"
      @directory = ''
      @file_type = ''
    end
    
    def build(app_name)
      %(# frozen_string_literal: true

# Rakefile generated for #{app_name} by Quartet
# Add tasks as required here

require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require './app'
  end
end

task :c do
  sh 'bundle exec irb -I. -r app.rb'
end

task :console do
  sh 'bundle exec irb -I. -r app.rb'
end

task :serve do
  sh 'bundle exec rackup config.ru'
end

task :s do
  sh 'bundle exec rackup config.ru'
end
)
    end
  end
end
