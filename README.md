# nodejs-app-docker
To provide a Docker skeleton for dockerizing NodeJS application

# How to use?
* 1.) Create new NodeJS "./app" directory 
The "./app" directory will be your NodeJS app directory.
```
mkdir ./app
```
* 2.) Build your NodeJS image
```
./build.sh
```
* 3.) Run your NodeJS container
```
./run.sh
```

# Example
```
mkdir ./app
cp -r ./example/* ./app/
./build.sh
./run.sh
```
Once start, you can access the NodeJS Web app
```
curl -i http://127.0.0.1:38080
```

# Configuration
You can change the host port when using "./run.sh" as the following show how to define the mapping between host port and NodeJS container's internal port. Note that the "#" is mandatory and no space behind either for "#PORTS_LIST ..." 
```
#### ---- NodeJS Dockerizing Docker ----
#PORTS_LIST="38080:8080"
```

## References & Resources
* [Docker ARG and ENV Guide](https://vsupalov.com/docker-arg-env-variable-guide/)
