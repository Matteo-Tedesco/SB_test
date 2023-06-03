FROM ruby:3.2.2

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

ARG APP_PATH=/opt/app
ARG APP_USER=appuser
ARG APP_GROUP=appgroup
ARG APP_USER_UID=7084
ARG APP_GROUP_GID=2001

#WORKDIR /usr/src/app
RUN apt-get update -qq && apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_20.x | bash  && apt-get install -y nodejs postgresql-client && npm install --global yarn
RUN addgroup --gid $APP_GROUP_GID --system $APP_GROUP && \
      adduser --system --shell /sbin/nologin --uid $APP_USER_UID --ingroup $APP_GROUP $APP_USER && \
      mkdir $APP_PATH && \
      chown $APP_USER:$APP_GROUP $APP_PATH
WORKDIR /opt/app
COPY --chown=$APP_USER:$APP_GROUP Gemfile Gemfile.lock $APP_PATH/
#RUN bundle install
USER $APP_USER
RUN bundle install
COPY --chown=$APP_USER:$APP_GROUP . $APP_PATH/
#COPY Gemfile Gemfile.lock ./
#RUN bundle install
#COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
