module Sekisho
  module Default
    module AllowSignedInOnly
      def authorized?
        current_user
      end
    end
  end
end
