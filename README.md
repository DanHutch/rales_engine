# README
## Rales_Engine

Rales Engine is a Ruby on Rails API that imports data from multiple CSV files and provides Fast JsonAPI formatted endpoints for a number of different Business Intelligence queries and Resource index and show pages. It was built by Dan Hutchinson (github: DanHutch) as an initial solo project for Module 3 of the Back-End Engineering program at the Turing School.

This project was built using Rails v5.1.6,  Ruby v2.4.1, and Postgresql 10.5 and comes with all the necessary gems in the Gemfile. After forking and cloning the repo, simply run "Bundle" from the command line. 

###Setup:

First, clone this repo:

```
git clone git@github.com:DanHutch/rales_engine.git
```
Then, run `bundle install` from the command line, from within the project directory. Then, you can create the database and schema using `rake db:{drop,create,migrate}`.

Once this is done, to import the data from CSV files in the 'lib' directory, run `rake import:data` from the command line. 

If done properly, you should now be able to run the local test suite using the command `rspec`. 

###Gems:

- rails
- pg
- puma
- byebug
- rspec-rails
- factory_bot_rails
- simplecov
- awesome_print
- pry
- database_cleaner
- shoulda-matchers
- fast_jsonapi
- listen
- spring
- spring-watcher-listen
- tzinfo-data

###API Endpoints:

There are 6 resources in this project's database, which are:

- Customers
- Invoices
- Invoice Items
- Items
- Merchants
- Transactions

Each of these resources has an index endpoint (`GET api/v1/<resource>/:id`), which shows all the resourches of that type, and a show endpoint, which shows a single resource (`GET api/v1/<resource>/:id`).

There are also relational endpoints:
```
GET api/v1/<resource>/:id/<related_resource>
```

Relational endpoints are as follows...

**Merchants:**
- Items
- Invoices

**Invoices:**
- Transactions
- Invoice Items
- Items
- Customer
- Merchant

**Invoice Items:**
- Invoices
- Item

**Items:**
- Invoice Items
- Merchant

**Transactions:**
- Invoice

**Customers:**
- Invoices
- Transactions

Finally, there are the Business Intelligence endpoints...

**Business Intelligence Endpoints:**

- GET `api/v1/merchants/most_revenue?quantity=x`
(returns the top x merchants ranked by total revenue)
- GET `api/v1/merchants/most_items?quantity=x`
(returns the top x merchants ranked by total number of items sold)
- GET `api/v1/merchants/revenue?date=x`
(returns the total revenue for date x across all merchants)
- GET `api/v1/merchants/:id/revenue`
(returns the total revenue for that merchant across successful transactions)
- GET `api/v1/merchants/:id/revenue?date=x`
(returns the total revenue for that merchant for a specific invoice date `x`)
- GET `api/v1/merchants/:id/favorite_customer`
(returns the customer who has conducted the most total number of successful transactions)
- GET `api/v1/GET /api/v1/items/most_revenue?quantity=x`
(returns the top `x` items ranked by total revenue generated)
- GET `api/v1/items/most_items?quantity=x`
(returns the top `x` item instances ranked by total number sold)
- GET `api/v1/items/:id/best_day`
(returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day)
- GET `api/v1/GET /api/v1/customers/:id/favorite_merchant`
(returns a merchant where the customer has conducted the most successful transactions)

###Contributing:

In order to contribute, please fork this repo, then clone your new repo and create a branch for your feature.

Please make sure to test your feature fully, using RSpec, before commiting your changes and pushing to your own repo, then create and submit a pull request back to this repository. 

Please contact Dan Hutchinson at DanHutch5280@gmail.com or via GitHub, if you have any questions, etc. 
