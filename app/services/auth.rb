class Auth
	attr_reader :data

	def initialize(email, password)
		@email = email
		@password = password
	end
	
	def authenticate
		HTTParty.post("#{Figaro.env.auth_base_url}/sessions.json", {body: '{ "user": { "email": "'+ @email +'", "password": "' + @password + '" } }',headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}})
	end
end