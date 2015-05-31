module DeviseInvitable
  class Engine < ::Rails::Engine

    ActiveSupport.on_load(:action_controller) { include DeviseSmsAuthenticable::Controllers::UrlHelpers }
    ActiveSupport.on_load(:action_view)       { include DeviseSmsAuthenticable::Controllers::UrlHelpers }

    config.after_initialize do
    
    end

  end
end
