FROM kazunori279/fluentd

RUN apt-get -y install libssl-dev 
RUN apt-get -y install build-essential
RUN apt-get -y install git
RUN git clone https://github.com/yuki-takeichi/fluent-plugin-twitter
RUN cd fluent-plugin-twitter/ && /usr/lib/fluent/ruby/bin/fluent-gem build fluent-plugin-twitter.gemspec && /usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-twitter-0.3.0.gem
RUN /usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-bigquery
RUN echo "" >  /etc/td-agent/td-agent.conf
ADD tweet.json .
