module Sekisho
  class << self
    def configure
      yield config
    end

    def config
      @config ||= Config.new
    end
  end

  class Config
    attr_accessor :suffix
    attr_accessor :query_method
    attr_accessor :shared_dir

    def initialize
      @suffix = 'Policy'
      @query_method = :authorized?
      @shared_dir   = 'shared'
    end
  end
end
