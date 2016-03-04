FROM 1science/sbt:0.13.8-oracle-jre-8

# Must specify the full revision here!
ENV revision 0f691ccbd375ccf5a92f96b4b5c934694d7ebe51

RUN wget -O frontend.tar.gz https://github.com/lorisdanto/automatatutor-frontend/archive/${revision}.tar.gz
RUN tar xzvf frontend.tar.gz automatatutor-frontend-${revision}/project automatatutor-frontend-${revision}/build.sbt
RUN cd automatatutor-frontend-${revision} && sbt
RUN rm -rf automatatutor-frontend-${revision} frontend.tar.gz
