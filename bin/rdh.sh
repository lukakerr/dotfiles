#!/bin/sh

# Usage
# rdh $BRANCH

branch=$1

# Precompile assets
rake assets:precompile RAILS_ENV=production

# Push
git push heroku $branch:master