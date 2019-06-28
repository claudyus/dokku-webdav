Dokku webdav
====================

This image can be used to run docker container in dokku PaaS without code modification.

The webdav server is serving the /data paths so the url should be similar to http://localhost:5000/data

USERNAME and PASSWORD env vars can be used to set the needed authentication.

Remember to mount the container dir /app/data outside the container for persistence.


Here and example of configuration:

	dokku storage:mount $APP /var/lib/dokku/data/storage/$APP:/app/data
	dokku config:set $APP PASSWORD=testpass