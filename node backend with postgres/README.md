# Node.js – JWT Authentication with PostgreSQL

## User Registration, User Login and Authorization process.
The diagram shows flow of how we implement User Registration, User Login and Authorization process.

![jwt-token-authentication-node-js-example-flow](jwt-token-authentication-node-js-example-flow.png)

You may need to implement Refresh Token:

![jwt-refresh-token-node-js-example-flow](jwt-refresh-token-node-js-example-flow.png)

## Project setup
```
npm install
```

Then, edit `app/config/db.config.js` with a correct postgres DB credentials.

### Run
```
node server.js
```

And then You are done, You can login in your app !