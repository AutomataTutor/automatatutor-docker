FROM tutor-build

ENV revision 0f691ccbd375ccf5a92f96b4b5c934694d7ebe51

RUN wget -O frontend.tar.gz https://github.com/lorisdanto/automatatutor-frontend/archive/${revision}.tar.gz
RUN tar xzf frontend.tar.gz
RUN cp automatatutor-frontend-${revision}/src/main/resources/props/default.props.template automatatutor-frontend-${revision}/src/main/resources/props/default.props
RUN cp automatatutor-frontend-${revision}/src/main/resources/props/production.default.props.template automatatutor-frontend-${revision}/src/main/resources/props/production.default.props
RUN cd automatatutor-frontend-${revision} && sbt compile
CMD cd automatatutor-frontend-${revision} && sbt ~container:start
