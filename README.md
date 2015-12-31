# haskell-gae

## Setup
```
stack setup
```

## Build
```
stack build
```

## Run
```
stack exec haskell-gae
```

## Local Test
```
http://localhost:8080/items
http://localhost:8080/items/1
http://localhost:8080/items/2
```

## Deploy
```
gcloud preview app deploy --promote --version test-1 app.yaml
```

## GAE Test
```
https://haskell-gae-rest-dot-<YOUR_PROJECT_ID>.appspot.com/items
```
