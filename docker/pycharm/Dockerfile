ARG username
ARG userid

USER root
RUN apt-get -q -y update
RUN apt-get install -q -y libxtst6 libxext6 libxi6
RUN apt-get install -q -y git
RUN apt-get install -q -y libcanberra-gtk*
RUN apt-get install -q -y packagekit-gtk3-module
RUN echo ${userid}
RUN echo ${username}
RUN useradd -m -u ${userid} ${username}
USER ${username}
