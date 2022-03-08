class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_admin_for_models, except: [:index, :show, :new, :edit]
  before_action :make_action_mailer_use_request_host_and_protocol
  before_action :nav_help

  def nav_help
#    @foremost_event = Event.where("DATE(start_date) >= ? ", Date.today).first
    @foremost_event = Event.where("DATE(end_date) >= ? ", Date.today).first
    @foremost_tag = Tag.where(starred: true).first
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protected
    def restrict_to_development
      head(:bad_request) unless Rails.env.development?
    end

	  def set_current_admin_for_models
	    Admin.current = current_admin
	  end

  private

	  def make_action_mailer_use_request_host_and_protocol
	    ActionMailer::Base.default_url_options[:protocol] = request.protocol
	    ActionMailer::Base.default_url_options[:host] = request.host_with_port
	  end

end
