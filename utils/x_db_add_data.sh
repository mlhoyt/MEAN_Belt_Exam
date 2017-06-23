# -*- shell -*-

# curl \
#   -X POST \
#   http://localhost:8000/api/scores \
#   --header 'Content-Type: application/json' \
#   --data '{"nrCorrect":1,"nrAsked":3,"user":"Zulu"}' \
# | python -m json.tool

# curl \
#   -X POST \
#   http://localhost:8000/api/scores \
#   --header 'Content-Type: application/json' \
#   --data '{"nrCorrect":3,"nrAsked":3,"user":"Alpha"}' \
# | python -m json.tool

# curl \
#   -X POST \
#   http://localhost:8000/api/scores \
#   --header 'Content-Type: application/json' \
#   --data '{"nrCorrect":2,"nrAsked":3,"user":"Bravo"}' \
# | python -m json.tool

