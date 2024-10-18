create:
	docker run --rm \
	-v main-volume:/data \
	-v restore-volume:/backup \
	alpine \
	sh -c "tar cvf /backup/backup.tar -C /data ."

restore:
	docker run --rm \
	-v main-volume:/data \
	-v restore-volume:/backup \
	alpine \
	sh -c "tar xvf /backup/backup.tar -C /data"
