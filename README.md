# Jungle

A mini e-commerce application built with Rails 4.2. The purpose of this project was to become familiar with Ruby on Rails, while learning how to navigate an existing code-base. The app was an inherited unfinished project in which we had to implement new features and bug fixes, with little explanation in order to simulate a real world experience. 

View screenshots of the final product futher down.

This project was created and published by me as part of my learnings at [Lighthouse Labs.](https://www.lighthouselabs.ca/)

## Features Implemented
<b> Sold Out Badge</b>: When product has 0 quantity, a sold out badge will be displayed on the product list page

<b> Admin Categories</b>: Admin users can list and create new categories. Admins can add new products using the new category, they can also delete products.

<b> User Authentication</b>: A visitor can go to registration page from any page to create an accout. A visitor can sign up for a user account and can log in. A user can log out from any page. A user cannot sign up with an existing email address. Passwods are encrypted using bcrypt gem

<b>Order Details Page</b>:
 The order page contains items, their image, name, description, quantities and line item totals. Email used to place order is displayed

## Bug Fixes
<b>Missing Admin Security</b>: User must enter HTTP auth login/password to access admin functionality

<b>Checking out with Empty Cart</b>: If visitor goes to the cart when cart is empty, a message is displayed indicating that there are no items in the cart. Visitor is prompted to keep shopping with link to products page

## Testing
- RSpec
- Capybara and Poltergeist

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots