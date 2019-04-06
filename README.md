# feathers-chat-phone-signup-sms

Based off https://github.com/feathersjs/feathers-chat 2019-04-06.
The goal of this repo is to provide a proof of concept for a user registration
via phone number. Phone number is the primary key and we verify control of the
number by sending a pin via sms and verifying the user after the pin is sent to
the api. Work in progress.

## Running

1. `npm install`
1. `cp .env.template .env` and add your Twilio secrets
1. `npm run dev` for nodemon or `npm start` for production

## Testing

There are some curl requests in /curls. They typically pipe responses to `jq` so
install that for more readable responses.

1. `brew install jq`
1. `sh curls/create-sms.sh` (only works if you relax the authorization in sms.hooks.js#all)
1. `sh user-create.sh 5005550006` creates an unverified user and sends an sms, review the api logs for the pin
1. `sh user-read.sh` lists users
1. `sh user-verify.sh <pin number>` verifies the user

## TODO

* verify users via short pin code. Currently this gives the error below:
```sh
$ sh curls/user-verify.sh 118903
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   208  100   156  100    52  17067   5689 --:--:-- --:--:-- --:--:-- 17333
{
  "name": "BadRequest",
  "message": "Expected string value. (authManagement)",
  "code": 400,
  "className": "bad-request",
  "data": {},
  "errors": {
    "$className": "badParams"
  }
}
```

* issue jwt to verified users
* enforce authorization by jwt and verified user accounts
