FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_16.x | bash  && apt-get install -y nodejs postgresql-client && npm install --global yarn
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]