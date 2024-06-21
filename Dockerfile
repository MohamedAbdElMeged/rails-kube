FROM ruby:3.1.2
ENV LANG C.UTF-8
ENV APP_ROOT /myapp


WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

COPY . /myapp
EXPOSE 3000
# CMD ["rails", "server", "-b", "0.0.0.0"]
ENTRYPOINT [ "sh","init.sh" ]
