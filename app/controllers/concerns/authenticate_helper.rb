module AuthenticateHelper
	extend ActiveSupport::Concern

	included do
		before_filter :authenticate!
	end

	def current_user
		
	end

	def authenticate!
		redirect_to sessions_path unless token && checker.has_key?('status')
	end

	private
		def checker
			Checker.new(session[:admin_email], session[:admin_token]).validate
		end

		def token
			session[:admin_token]
		end
end