module Sekisho
  module Generators
    class PolicyGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      argument :action_name

      def copy_application_policy
        suffix = Sekisho.config.suffix.underscore
        template 'policy.rb', "app/#{suffix.pluralize}/#{file_path}/#{file_name}_#{suffix}.rb"
      end

      def copy_action_policy
        suffix = Sekisho.config.suffix.underscore
        template 'actions/policy.rb', "app/#{suffix.pluralize}/#{file_path}/actions/#{action_name}_#{suffix}.rb"
      end
    end
  end
end
