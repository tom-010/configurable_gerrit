FROM gerritcodereview/gerrit


USER root
RUN git config --global user.email "gerritadmin@localhost" && git config --global user.name "gerritadmin"
RUN mkdir /work && chmod 777 /work
RUN yum install -y python3
# USER gerrit

ADD entrypoint-override.sh /entrypoint-override.sh
ADD project.config /initial-project.config
ADD configure-gerrit.sh /configure-gerrit.sh

ENTRYPOINT ["/entrypoint-override.sh"]