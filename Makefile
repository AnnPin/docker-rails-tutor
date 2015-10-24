image_name = annpin/docker-rails-tutor
container_name = docker-rails-tutor
host_port1 = 8888
container_port1 = 80
host_port2 = 3000
container_port2 = 3000
src_path1 = /vagrant/docker-rails-tutor/www
dst_path1 = /www
# src_path2 = /vagrant/docker-rails-tutor/db_sql
# dst_path2 = /db_sql

# db_name = "db_name"
# db_user_name = "user_name"
# db_user_pass = "password"

# --------------------------------------------------

setup:		build run db-setup
		echo "Completed."
setup-nc:	build-nc run db-setup
		echo "Completed."
rerun:		clean run db-setup
build:
		docker build --force-rm -t $(image_name) .
build-nc:
		docker build --force-rm --no-cache -t $(image_name) .
run:
		docker run -itd \
			-p $(host_port1):$(container_port1) \
			-p $(host_port2):$(container_port2) \
			-v $(src_path1):$(dst_path1) \
			--name $(container_name) $(image_name):latest
bash:
		docker exec -it $(container_name) /bin/bash
db-setup:
		#sleep 5
		#docker exec -it $(container_name) /bin/bash -c "mysql -h localhost -u $(db_user_name) < $(dst_path2)/init.sql"
		#docker exec -it $(container_name) /bin/bash -c "mysql -h localhost -u $(db_user_name) -p$(db_user_pass) $(db_name) < $(dst_path2)/dump.sql"
db-backup:
		#docker exec -it $(container_name) /bin/bash -c 'cur_time=`date "+%s"` && mv $(dst_path2)/dump.sql $(dst_path2)/dump.sql.old$${cur_time}'
		#docker exec -it $(container_name) /bin/bash -c 'mysqldump -h localhost -u $(db_user_name) -p$(db_user_pass) --default-character-set=utf8 --events $(db_name) > "$(dst_path2)/dump.sql"'

destroy:	stop rm rmi
		echo "Completed."
clean:		stop rm
		echo "Completed."
start:
		docker start $(container_name)
stop:		db-backup
		docker stop $(container_name)
restart:
		docker restart $(container_name)
rm:
		docker rm $(container_name)
rmi:
		docker rmi $(image_name)
logs:
		docker logs $(container_name)
ps:
		docker ps
psa:
		docker ps -a
inspect:
		docker inspect $(image_name)
access:
		docker exec -it $(container_name) /usr/bin/vim /var/log/apache2/access.log
error:
		docker exec -it $(container_name) /usr/bin/vim /var/log/apache2/error.log
inc:
		docker exec -it $(container_name) /usr/bin/perl -E '-d and say for @INC'

