# haskell-gae

haskell-gae is an example project to demonstrate the use of Haskell to create a REST API hosted on Google Cloud Platform as a Google App Engine component.

## Prerequisites

To run locally you must have Haskell and Stack installed on your operating system.  To upload to GCP you need to have editor rights to a GCP project and have the gcloud tool installed and available on your OS path.

For further information on installing Haskell or Stack for your OS please see:

https://www.haskell.org/platform/
http://docs.haskellstack.org/en/stable/README.html

The following may be useful info for setting up GCP:

https://cloud.google.com/compute/docs/projects
https://cloud.google.com/sdk/gcloud/

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
