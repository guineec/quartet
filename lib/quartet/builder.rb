# frozen_string_literal: true

module Quartet::Builders
  class Builder
    def initialize
      @directory = ''
      @file_type = '.rb'
    end

    def filepath(app_name)
      unless @name_override
        return "#{app_name}/#{@directory}/#{underscore(self.class.to_s.split('::')[-1])}#{@file_type}"
      end

      "#{app_name}/#{@directory}/#{@name_override}#{@file_type}"
    end

    def underscore(string)
      string.gsub(/::/, '/')
            .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
            .gsub(/([a-z\d])([A-Z])/, '\1_\2')
            .tr('-', '_')
            .downcase
    end

    def build(app_name)
      puts "No build instructions implemented for #{self.class.to_s}"
    end
  end
end
