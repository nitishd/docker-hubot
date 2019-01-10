# Hubot Docker build

Build Docker image for Hubot with custom plugins.


## Installing

- Get Slack bot token
- Copy .env.sample to .env, add slack bot token. Modify other variables if needed.
- Build docker image

```
docker build -t huber .
```

- Run it
```
docker-compose up
```


## Customise

By default the config contains plugins to connect Slack -> Hubot -> Jenkins.


### Add custom plugins

- `npm install --save hubot-shy`
- Add `hubot-shy` to `external-scripts.json`
- Set environment variables as needed in `.env`