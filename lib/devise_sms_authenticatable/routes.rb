module ActionDispatch::Routing
  class Mapper

    protected
      def devise_sms_sessions(mapping, controllers)
        resource :sms_sessions, :only => [:new, :create], :path => mapping.path_names[:sms_sessions], :controller => controllers[:sms_sessions] do
          get :resend, :path => mapping.path_names[:resend], :as => :resend
          post :send_sms, :path => mapping.path_names[:send_sms], :as => :send_sms
        end
      end

  end
end