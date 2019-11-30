FROM ruby:2.6.2-stretch

# Copy application code
COPY . /application
# Change to the application's directory
WORKDIR /application

# Install gems
RUN bundle install --deployment --without development test