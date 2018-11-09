require "active_support/concern"
require "sekisho/version"
require "sekisho/config"

module Sekisho
  extend ActiveSupport::Concern

  def authorize!(resource = nil)
    policy = Sekisho::PolicyLoader.new(policy_class).load!.new(resource, sekisho_user)
    policy.send(Sekisho.config.query_method) or raise Errors::NotAuthorizedError
  end

  private

  def policy_class
    Sekisho::PolicyClass.new(sekisho_controller_name, sekisho_action_name)
  end

  def sekisho_controller_name
    params[:controller]
  end

  def sekisho_action_name
    params[:action]
  end

  def sekisho_user
  end
end
