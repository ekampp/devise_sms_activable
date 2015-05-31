module ActionDispatch::Routing
  class Mapper

    protected
      def devise_sms_sessions(mapping, controllers)
        resource :sms_sessions, :only => [:new, :create], :path => mapping.path_names[:sms_sessions], :controller => controllers[:sms_sessions] do
          match :consume, :path => mapping.path_names[:consume], :as => :consume, :via => [:get, :post]
          get :insert, :path => mapping.path_names[:insert], :as => :insert
        end
      end

  end
end