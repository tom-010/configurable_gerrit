FROM gerritcodereview/gerrit


USER root
RUN git config --global user.email "gerritadmin@localhost" && \
    git config --global user.name "gerritadmin" && \
    git config --global advice.detachedHead false
RUN mkdir /work && chmod 777 /work
RUN yum install -y python3
RUN chown gerrit /home -R

RUN mkdir /plugins

ADD entrypoint-override.sh /entrypoint-override.sh
ADD configure-gerrit.sh /configure-gerrit.sh

ENTRYPOINT ["/entrypoint-override.sh"]