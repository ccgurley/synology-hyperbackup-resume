# Synology Hyper Backup Scheduler

Created to solve an issue documented here - https://community.synology.com/enu/forum/5/post/154857

## Configuration

Docker compose example:

```yaml
version: '2.1'
services:
    monitor:
      restart: unless-stopped
      image: ccgurley/synology-hyperbackup-resume:latest
      environment:
        - DSM=http://<localip>:5000
        - PASSWORD=password
        - VERIFY_SSL=false
        - TZ=Australia/Brisbane
        - FREQUENCY=1  #in minutes
```

## WARNING

Use at your own risk, its possible the api changes later and this doesn't work or breaks something.

## Development

Build the docker image

    docker build -t <image/tag:release> .

Run the docker image manually with docker compose

```yaml
version: '2.1'
services:
    monitor:
      restart: unless-stopped
      image: <image/tag:release>
      environment:
        - DSM=http://<localip>:5000
        - PASSWORD=password
        - VERIFY_SSL=false
        - TZ=Australia/Brisbane
        - FREQUENCY=1  #in minutes
```

## Credits 

Bassed off work from: 
  - https://github.com/johnf/synobackup
  - https://github.com/tomasgatial/synobackup
