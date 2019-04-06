curl --header "Content-Type: application/json" \
  --data "{ 
    \"action\": \"verifySignupShort\", 
    \"value\": \"$1\" 
  }" \
http://localhost:3030/authmanagement | jq
