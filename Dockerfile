# Specify the correct Ruby version
FROM ruby:3.2.2

# Set the working directory in the container
WORKDIR /app

# Install the correct version of Bundler
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.4.10 && bundle install

# Copy the rest of your application
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]