module Sekisho
  class PolicyClass
    attr_accessor :controller, :action

    def initialize(controller, action = nil)
      @controller = controller
      @action = action
    end

    def class_name
      path =  Pathname.new(controller) / action_dir / basename
      path.to_path.camelize
    end
    alias_method :to_s, :class_name

    def path
      class_name.underscore + '.rb'
    end

    private

    def controller_policy?
      action.nil?
    end

    def action_dir
      controller_policy? ? '' : 'actions'
    end

    def basename
      basename = if controller_policy?
                   File.basename(controller)
                 else
                   action
                 end + Sekisho.config.suffix
      basename.underscore
    end
  end
end
