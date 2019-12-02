# README



Contents

* Ruby version
* System dependencies
* Configuration
* GraphQL Queries/Mutations
* JSON Routes
* Database Related Info

### GraphQL queries

[follow me](./GraphQL.md)

### Available JSON Routes

Should mention that some of these have an equivalent HTML routes with templates.
Some templates are missing as these will not be used since we are using react and
polaris. 

<b>List of Users</b> (need to be admin or user peterspam user)
- /users.json 
- /users (This is the equivalent html route)

<b>Budget Plans</b> (currently logged in user)
- /users/budget_plans.json

<b>Categories</b> (returns all valid categories these are not user specific)
- /categories.json

<b>Expenses</b>
- /plan/:budget_plan_id/expenses.json

On AvtiveRecord::RecordNotFound error -> returns json {"error":"Budget plan not found for this user."}


### Database initialization and Database creation

Database [Schema](./db/BudgetCop.png)

The project is managed by dev up utility, upon executing `dev up`, an empty mySql database will get created for you.

Once you have the project up and running with `dev server` execute the following command
```
  rails db:seed
```


* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
