require "active_support/concern"
require "sekisho/version"
require "sekisho/config"
require "sekisho/policy_loader"
require "sekisho/policy_class"
Dir[File.dirname(__FILE__) + "/sekisho/*/*.rb"].each { |file| require file }

module Sekisho
  extend ActiveSupport::Concern

  def authorize!(resource = nil)
    policy = Sekisho::PolicyLoader.new(policy_class).load!.new(resource, sekisho_user)
    policy.send(Sekisho.config.query_method) or raise Sekisho::Errors::NotAuthorizedError
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
    current_user
  end
end
