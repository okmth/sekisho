module Sekisho
  module Default
    module Allow
      define_method(Sekisho.config.query_method) { true }
    end
  end
end
