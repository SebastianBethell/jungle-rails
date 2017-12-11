# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
In this project I inherited an existing code base and added features to it as well as fixed bugs.

This app was build with Ruby on Rails, PostgreSQL, Bcrypt, and Stripe.  The styling was done with Bootstrap, Sass and Css.

A user can visit the main page for a listing of all products or view them by catagory.  I have added user registration which allows creation/destruction of reviews which are attached to that particular user.  A user can purchase a product and the payment system uses Stripe for processing.

There is an admin section which allows new products and catagories to be added.  The admin section is restricted by HTTP authorization.


## Screenshots
!["This shows the main page to feature avg. rating on a product as well as the sold out badge "](https://github.com/SebastianBethell/jungle-rails/blob/master/docs/main-page-sold-out.png)
!["Products can be reviewed by a logged in user.  Only THAT user can delete the review."](https://github.com/SebastianBethell/jungle-rails/blob/master/docs/product-reviews.png)
!["To access any of the admin pages/options the user must know the admin login information"](https://github.com/SebastianBethell/jungle-rails/blob/master/docs/admin-auth.png)
!["Only the admin can create new catagories which new products can then be added to"](https://github.com/SebastianBethell/jungle-rails/blob/master/docs/admin-categories.png)



## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe


