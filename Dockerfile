FROM phusion/baseimage:0.9.19

# Use baseimage-docker's init system.
CMD /sbin/my_init

# ...put your own build instructions here...
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade

RUN apt-get install -y python rubygems build-essential ruby-full

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

RUN gem update --system
RUN gem install jekyll
RUN gem install jekyll-paginate

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/srv/blog"]

WORKDIR /srv/blog

EXPOSE 4000
CMD jekyll serve -w --host 0.0.0.0 --port 4000