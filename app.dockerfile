FROM ruby:3.2.2

WORKDIR /myapp
RUN apt-get update -qq && apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_16.x | bash  && apt-get install -y nodejs postgresql-client && npm install --global yarn
COPY Gemfile /Gemfile
COPY Gemfile.lock /Gemfile.lock
RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
