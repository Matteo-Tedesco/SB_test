FROM ruby:3.2.2

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app
RUN apt-get update -qq && apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_16.x | bash  && apt-get install -y nodejs postgresql-client && npm install --global yarn
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
