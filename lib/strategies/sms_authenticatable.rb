require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    # Default strategy for signing in a user, based on their email and password in the database.
    class SmsAuthenticatable
      def valid?
        # params.has_key?(:sms_token)
        true
      end

      def authenticate!
        resource  = sms_token.present? && mapping.to.find_for_database_authentication(authentication_hash)
        encrypted = false

        if validate(resource){ resource.valid_sms_token?(sms_token) }
          remember_me(resource)
          resource.after_sms_authentication
          success!(resource)
        end

        fail(:not_found_in_database) unless resource
      end
    end
  end
end

Warden::Strategies.add(:sms_authenticatable, Devise::Strategies::SmsAuthenticatable)
