module Sekisho
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      def copy_application_policy
        suffix = Sekisho.config.suffix.underscore
        template 'application_policy.rb', "app/#{suffix.pluralize}/application_#{suffix}.rb"
      end
    end
  end
end
