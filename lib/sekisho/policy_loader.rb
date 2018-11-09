module Sekisho
  class PolicyLoader
    attr_reader :policy_class, :termination

    def initialize(policy_class, termination: false)
      @policy_class = policy_class
      @termination  = termination
      @policy_class.action = nil if termination
    end

    def load!
      policy = Object.const_get(policy_class.class_name)
      policy.instance_methods(!termination).include?(Sekisho.config.query_method) or
        raise Errors::AuthorizedQueryMethodNotDefinedError.new(policy)
      policy
    rescue LoadError, NameError => e
      raise Errors::PolicyNotFoundError.new(policy_class) if termination
      self.class.new(policy_class, termination: true).load!
    end

    def query_method_defined?(policy)
      policy.instance_methods(!termination).include?(Sekisho.config.query_method)
    end
  end
end
