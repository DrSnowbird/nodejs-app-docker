#FROM openkbs/jdk-mvn-py3-x11
FROM node:10

MAINTAINER "DrSnowbird <DrSnowbird@openkbs.org>"

#### ---- Build Specification ----
# Metadata params
ARG BUILD_DATE=${BUILD_DATE:-}
ARG VERSION=${BUILD_DATE:-}
ARG VCS_REF=${BUILD_DATE:-}

#### ---- Product Specifications ----
ARG PRODUCT=${PRODUCT:-}
ARG PRODUCT_VERSION=${PRODUCT_VERSION:-}
ARG PRODUCT_DIR=${PRODUCT_DIR:-}
ARG PRODUCT_EXE=${PRODUCT_EXE:-}
ENV PRODUCT=${PRODUCT}
ENV PRODUCT_VERSION=${PRODUCT_VERSION}
ENV PRODUCT_DIR=${PRODUCT_DIR}
ENV PRODUCT_EXE=${PRODUCT_EXE}

# Metadata
LABEL org.label-schema.url="https://imagelayers.io" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$VERSION \
      org.label-schema.vcs-url="https://github.com/microscaling/imagelayers-graph.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.description="This dockerizing NodeJS app into Docker." \
      org.label-schema.schema-version="1.0"
      
#### ---- Dockerizing NodeJS app ---- ####
ARG NODEJS_APP_HOST_DIR=${NODEJS_APP_HOST_DIR:-"./app"}
ENV NODEJS_APP_HOST_DIR=${NODEJS_APP_HOST_DIR}

## -- Create new user: nodejs/nodejs --##
ENV USER_NAME=nodejs
ENV USER_HOME=/home/${USER_NAME}
RUN groupadd -r ${USER_NAME} \
   && useradd -m -d ${USER_HOME} -r -g ${USER_NAME} ${USER_NAME}
   
ENV WORK_DIR=${USER_HOME}/app

USER nodejs

# Create app directory
#WORKDIR /usr/src/app
RUN mkdir ${USER_HOME}/app
WORKDIR ${WORK_DIR}

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY ${NODEJS_APP_HOST_DIR}/package*.json ./

# If you are building your code for production
# RUN npm install --only=production
RUN npm install

# Bundle app source
COPY ./app .

EXPOSE 8080
CMD [ "npm", "start" ]

