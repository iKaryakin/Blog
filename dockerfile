FROM ruby:2.4.1
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y nodejs \
                       vim \
                       mysql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile* ./
RUN bundle install

COPY . .
COPY docker-entrypoint.sh /usr/local/bin/
COPY wait-for-it.sh /usr/local/bin/
# ENTRYPOINT ["docker-entrypoint.sh"]
# ENTRYPOINT ./wait-for-it.sh db:3306 -t 60

EXPOSE 4000

CMD ["rails", "server", "-b", "0.0.0.0"]



