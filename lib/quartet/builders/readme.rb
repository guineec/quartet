# frozen_string_literal: true

module Quartet::Builders
  class Readme < Quartet::Builders::Builder
    def initialize
      @name_override = 'README'
      @directory = ''
      @file_type = '.md'
    end

    def build(app_name)
      %(# #{app_name}
Things to include here:
- A description of your app
- Instructions for installation/build
- Instructions for development/running tests etc
- Licence information
- ...
)
    end
  end
end
