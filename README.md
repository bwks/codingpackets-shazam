# codingpackets-shazam

## Build
```
docker compose \
  --file docker-compose.yaml \
  --env-file .env\
  build --no-cache \
    --build-arg APP_NAME=codingpackets \
    --build-arg APP_OWNER='Bradley Searle' \
    --build-arg APP_OWNER_EMAIL="bradleysearle@gmail.com" \
    --build-arg APP_USER=$USER \
    --build-arg APP_USER_ID=$UID \
    --build-arg APP_GROUP_ID=$GID \
    --build-arg HOME_DIR=$HOME
```

## Run
```
docker compose \
  --file docker-compose.yaml \
  --env-file .env \
  up
```

## Shutdown
```
docker compose \
  --file docker-compose.yaml \
  --env-file .env \
  down
```
