# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new(:email => "admin@protoapp.com",
                :password => "admin",
                :password_confirmation => "admin")
user.isAdmin = true
user.save

user = User.new(:email => "john@example.com",
                :password => "password",
                :password_confirmation => "password")
user.save

user = User.new(:email => "mary@example.com",
                :password => "password",
                :password_confirmation => "password")
user.save

user = User.new(:email => "paul@example.com",
                :password => "password",
                :password_confirmation => "password")
user.save

proj = Assignment.new(:title => "Assignment 1: Use Cases",
                      :description => "In the assignment, you are asked to reserach on the importance and " \
                                      + "usage of use cases. Include examples and your thoughts on " \
                                      + "the topic.")
proj.save

proj = Assignment.new(:title => "Assignment 2: Rails App",
                      :description => "In the assignment, you are asked to write a simple Rails " \
                                      + "application to be used in a school library that has the following " \
                                      + "functions:\n" \
                                      + "(1) a menu to enter a book's information such as title, author ... " \
                                      + "(2) check-in and check-out of books " \
                                      + "(3) listing of all books in the system and their status")
proj.save

proj = Assignment.new(:title => "Assignment 3: Design Patterns Tutorial",
                      :description => "You may create a short video (no more than 10 minutes) to describe " \
                                      + "one of the design patterns discussed in class. Alternatively, " \
                                      + "you may submit a slide presentation with a script.")
proj.save