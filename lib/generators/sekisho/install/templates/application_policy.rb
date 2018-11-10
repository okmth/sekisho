class Application<%= Sekisho.config.suffix %>
  include Sekisho::Default::Allow
  # include Sekisho::Default::Deny
  # include Sekisho::Default::AllowSignedInOnly

  attr_reader :user, :record

  def initialize(record)
    @record = record
  end
end
