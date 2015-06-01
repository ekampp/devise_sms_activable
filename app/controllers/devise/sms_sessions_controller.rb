class Devise::SmsSessionsController < Devise::SessionsController

  # GET /resource/sms_sessions/resend
  def resend
    build_resource({})
    render :resend
  end

  # POST /resource/sms_sessions/send_sms
  # Note: send method is not useable, so use send_sms instead
  def send_sms
    self.resource = resource_class.send_sms_token(params[resource_name])
    
    if resource.errors.empty?
      set_flash_message :notice, :send_token, :phone => self.resource.phone
      redirect_to new_sms_sessions_path(resource_name)
    else
      render :resend
    end
  end

  # GET /resource/sms_sessions/new
  def new
    super
  end

  # POST /resource/sms_sessions/
  def create
    super
  end
  
  protected
  
    def build_resource(hash = nil)
      self.resource = resource_class.new
    end

end
