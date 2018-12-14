FROM mysql/mysql-cluster

COPY *.cnf /etc/
COPY *.sql /opt/
COPY healthcheck.sh /

ENTRYPOINT [ "/entrypoint.sh" ]

