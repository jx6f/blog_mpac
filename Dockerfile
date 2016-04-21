FROM seapy/rails-nginx-unicorn
MAINTAINER jx6f(matsunaga@cyberdefense.jp)

RUN bundle exec rake db:migrate
RUN gem install pry 

EXPOSE 80
