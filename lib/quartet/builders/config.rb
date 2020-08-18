# frozen_string_literal: true

module Quartet::Builders
  class Config < Quartet::Builders::Builder
    def initialize
      @directory = ''
      @file_type = '.ru'
    end

    def build(_app_name)
      %{# frozen_string_literal: true

require 'rubygems'
require 'bundler'

Bundler.require

require File.join(File.dirname(__FILE__), 'app.rb')
run Sinatra::Application
}
    end
  end
end
