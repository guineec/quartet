# frozen_string_literal: true

module Quartet::Builders
  class Database < Quartet::Builders::Builder
    def initialize
      @directory = 'config'
      @file_type = '.yml'
    end

    def build(app_name)
      %(development:
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: #{underscore(app_name)}
  pool: 5
  username: root
  password: root
)
    end
  end
end
