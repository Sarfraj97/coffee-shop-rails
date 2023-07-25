FROM ruby:3.1.2

RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client

ADD . /coffee-shop-rails
WORKDIR /coffee-shop-rails
RUN bundle install

EXPOSE 3000

CMD ["bash"]