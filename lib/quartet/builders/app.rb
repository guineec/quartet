# frozen_string_literal: true

module Quartet::Builders
  class App < Quartet::Builders::Builder
    def build(_app_name)
      %{# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'

# Require files in models and lib directories
Dir["./models/*.rb"].each {|file| require_relative file }
Dir[File.join("./lib", "**/*.rb")].each {|file| require_relative file }

get '/' do
  erb :welcome
end
}
    end
  end
end
