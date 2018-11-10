class Application<%= Sekisho.config.suffix %>
  include Sekisho::Default::Allow
  # include Sekisho::Default::Deny
  # include Sekisho::Default::AllowSignedInOnly

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end
end
