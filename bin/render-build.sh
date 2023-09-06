#!usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate

# Run: chmod a+x bin/render-build.sh

# After connecting to Render Run: bundle lock --add-platform x86_64-linux