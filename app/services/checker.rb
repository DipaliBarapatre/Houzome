class Checker
	def initialize(email, token)
		@email = email
		@token = token
	end
	
	def validate
	  HTTParty.get("#{Figaro.env.auth_base_url}/admin.json", {headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json', 'X-User-Email' => @email, 'X-Auth-Token' => @token}})
	end

	def signout
		HTTParty.delete("#{Figaro.env.auth_base_url}/sessions.json", {body: '{ "user": { "email": "'+ @email + '" } }',headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json', 'X-Auth-Token' => @token, 'X-User-Email' => @email}})
	end
end