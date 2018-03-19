# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - All controllers inherit from Sinatra::Base.
- [x] Use ActiveRecord for storing information in a database - Both classes inherit from ActiveRecord::Base, and migrations inherit from ActiveRecord::Migration.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - 2 model classes: User and Beverage.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - User has_many Beverages.
- [x] Include user accounts - Users can signup and login
- [x] Ensure that users can't modify content created by other users - Users can only edit and delete beverage instances that belongs_to the current/logged_in User.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Beverages can be created by a user, displayed/read by selecting the instance on user's profile and BevFeed, edited and updated only if created by the current user, and deleted only if created by the user.
- [x] Include user input validations - If a user submits and invalid form, the user will be redirected back to the form and an error message (in the form of a flash message) will appear. Only comments can be left blank.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - an error message will appear when there is a validation error. The Gemfile includes rack-flash3.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits - 60+ commits
- [x] Your commit messages are meaningful - I added a very specific note to every commit
- [x] You made the changes in a commit that relate to the commit message - Yes
- [x] You don't include changes in a commit that aren't related to the commit message - No
