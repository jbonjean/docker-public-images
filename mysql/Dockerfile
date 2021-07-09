FROM jbonjean/base-ubuntu-20.04

RUN apt-get update && \
	eatmydata apt-get install -y --no-install-recommends mysql-server && \
	cleanup

RUN sed -Ei \
	-e 's/^log_error.*/# log_error =/' \
	-e 's/^(bind-address\t*=).*/\1 0.0.0.0/' \
	-e 's/^(mysqlx-bind-address\t*=).*/\1 0.0.0.0/' \
	/etc/mysql/mysql.conf.d/mysqld.cnf

COPY etc /etc
