require 'rake'
require 'mail'
require 'yaml'
require 'nokogiri'

class App
  class << self
    def root
      @@root ||= begin
        File.expand_path File.dirname(__FILE__)
      end
    end

    def config
      @@config ||= begin
        YAML.load_file(File.join(App.root, 'config/application.yml'))
      end
    end
  end
end
