module AuthenticateHelper
	extend ActiveSupport::Concern

	included do
		before_filter :authenticate!
	end

	def current_user

	end

	def authenticate!
		if token
			
		else
			redirect_to sessions_path
		end
		output = HTTParty.post("#{Figaro.env.auth_base_url}/sessions.json", {body: '{ "user": { "email": "admin@example.com", "password": "password" } }',
		headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
		})
	end

	def token
		session['admin_token']
	end
end