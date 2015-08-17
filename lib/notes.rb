class Mynotes
# TODO clean untracked files from git clean -f , files and folders git clean -fd, to preview place -n flag 
# TODO 2::   Amazon s3 Cors configuration
	# <?xml version="1.0" encoding="UTF-8"?>
	# <CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
	#     <CORSRule>
	#         <AllowedOrigin>*</AllowedOrigin>
	#         <AllowedMethod>GET</AllowedMethod>
	#         <AllowedMethod>POST</AllowedMethod>
	#         <AllowedMethod>PUT</AllowedMethod>
	#         <MaxAgeSeconds>3000</MaxAgeSeconds>
	#         <AllowedHeader>*</AllowedHeader>
	#     </CORSRule>
	# </CORSConfiguration>
	# What this does is allowing our application located at localhost:3000 to submit a file straight to our s3 bucket. Changing the  * in AllowedOrigin to your actual domain is required when you move to production.

# TODO 3::
	def initialize
	end
end