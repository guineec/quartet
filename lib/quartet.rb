# frozen_string_literal: true

require 'quartet/version'
require 'quartet/builder'
require 'rainbow/refinement'
require 'fileutils'

module Quartet
  using Rainbow

  class Error < StandardError; end
  class BundlerFailedError < StandardError; end

  def create_app(app_name)
    puts "Creating #{app_name}...".green
    print 'Creating directories... '
    create_directories(app_name)
    puts '[ DONE ]'.green
    print 'Building app files... '
    build_app_files(app_name)
    puts '[ DONE ]'.green
    puts 'Running bundler...'
    Dir.chdir(app_name)
    output = `bundle`
    puts output
    puts "Project #{app_name} created!".green
    puts 'The following rake tasks are now available...'
    puts %(
    rake db:create            # Create the database from DATABASE_URL or config/database.yml for the current Rails.env (use db:create:all to create all dbs in the config)
    rake db:create_migration  # Create a migration (parameters: NAME, VERSION)
    rake db:drop              # Drops the database using DATABASE_URL or the current Rails.env (use db:drop:all to drop all databases)
    rake db:fixtures:load     # Load fixtures into the current environment's database
    rake db:migrate           # Migrate the database (options: VERSION=x, VERBOSE=false)
    rake db:migrate:status    # Display status of migrations
    rake db:rollback          # Rolls the schema back to the previous version (specify steps w/ STEP=n)
    rake db:schema:dump       # Create a db/schema.rb file that can be portably used against any DB supported by AR
    rake db:schema:load       # Load a schema.rb file into the database
    rake db:seed              # Load the seed data from db/seeds.rb
    rake db:setup             # Create the database, load the schema, and initialize with the seed data (use db:reset to also drop the db first)
    rake db:structure:dump    # Dump the database structure to db/structure.sql
    rake db:version           # Retrieves the current schema version number
    rake serve                # Start the development server
    rake console              # Start the interactive shell
  )
  end

  def create_directories(app_name)
    base_dir = Dir.getwd
    app_dir = "#{base_dir}/#{app_name}"
    FileUtils.mkdir_p(app_dir)
    %w[config db models public tmp views].each { |dirname| FileUtils.mkdir_p("#{app_dir}/#{dirname}") }
  end

  def build_app_files(app_name)
    Gem.find_files('quartet/builders/*.rb').each do |file|
      file_name = file.split('/')[-1].gsub('.rb', '')
      require "quartet/builders/#{file_name}"

      file_builder = Kernel.const_get("Quartet::Builders::#{file_name.capitalize}").new

      File.open(file_builder.filepath(app_name), 'w') do |f|
        f.write(file_builder.build(app_name))
        f.flush
      end
    end
  end

  module_function :create_app, :create_directories, :build_app_files
end
