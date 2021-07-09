FROM jbonjean/base-ubuntu-20.04

RUN apt-get update && \
	eatmydata apt-get install -y --no-install-recommends mysql-server && \
	rm -rf /var/lib/mysql /var/run/mysqld/ && \
	cleanup

COPY usr /usr
COPY etc /etc
RUN /usr/bin/mysqld-initialize
