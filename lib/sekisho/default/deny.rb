module Sekisho
  module Default
    module Deny
      define_method(Sekisho.config.query_method) { false }
    end
  end
end
