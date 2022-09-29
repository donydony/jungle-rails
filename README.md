# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml` (make sure postgres is running and may need to create development role with development as password)
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

To obtain Stripe keys, register for a Stripe account and find your own publishable and secret keys on your profile (for dev section).

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Testing

In order to run the app in testing mode, start the server with test env variable: 'bin/rails s -b 0.0.0.0 -e test'

## Screenshots

!["Screenshot of Homepage"](https://github.com/donydony/jungle-rails/blob/master/docs/Homepage.PNG)

!["Screenshot of Registration Screen"](https://github.com/donydony/jungle-rails/blob/master/docs/Register.PNG)

!["Screenshot of Admin Dashboard"](https://github.com/donydony/jungle-rails/blob/master/docs/Admin%20Dashboard.PNG)