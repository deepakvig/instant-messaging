# README

This is an instant messaging app

Things that are covered:

* Login using session

* add a dialect

* API to convert message according to the dialect

* Update currently active users


# Setup

bundle install

rake db:migrate

rails s thin


# Run Tests

rspec


# Using the application

Add a username and select a dialect and login

Send an instant message in chat room


# API

POST /api/v1/convert_messages
params : type, msg

# Pending Items

Remove a user when logs out 
Dialect image
Adding more Test cases
API currently converts only 5 messages in hours (using Free version)