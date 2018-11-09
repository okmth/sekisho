module Sekisho
  module Errors
    class AuthorizedQueryMethodNotDefinedError < StandardError
      def initialize policy_class
        super "Authorized query method #{Sekisho.config.query_method} is not defined"
      end
    end
  end
end
