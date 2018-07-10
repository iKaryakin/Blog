FROM ruby:2.4.1
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y nodejs \
                       vim \
                       mysql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/amiron/devel/blog

COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 4000
CMD ["rails", "server", "-b", "0.0.0.0"]



