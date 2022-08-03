# #Just sticking these here in case we need to stub anything again, could be good to use as reference. Not really necessary to keep around at this point otherwise though!

# stub_request(:post, "https://moon-garden-be.herokuapp.com/api/v1/users").
# with(
#   body: "{\"name\":\"Jennifer Halloran\",\"email\":\"frankfurters@weinermobile.com\",\"unverified_email\":\"frankfurters@weinermobile.com\",\"email_verified\":true,\"first_name\":\"Jennifer\",\"last_name\":\"Halloran\",\"image\":\"https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c\"}",
#   headers: {
#  'Accept'=>'*/*',
#  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
#  'Content-Type'=>'application/json',
#  'User-Agent'=>'Faraday v2.4.0'
#   }).
# to_return(status: 200, body: json_response, headers: {})

# json_response = {
#     "data": {
#       "id": "1",
#       "type": "user",
#       "attributes": {
#         "name": "Jennifer",
#         "email": 'frankfurters@weinermobile.com',
#         "image": "https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-cﬁ",
#       }
#     }
# }.to_json
