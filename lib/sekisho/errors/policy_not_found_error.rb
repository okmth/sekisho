module Sekisho
  module Errors
    class PolicyNotFoundError < StandardError
      def initialize(policy_class)
        super "Not found Policy class #{policy_class}, expected found in #{policy_class.path}"
      end
    end
  end
end
