FROM node:14-alpine

RUN apk add --no-cache git
#this is commit to check the work item integration with ADO
WORKDIR /app

RUN rm -rf subdirectory

RUN git clone https://github.com/Mageshpoopathi/React.git subdirectory

WORKDIR /app/subdirectory

RUN npm cache clean --force \
    && rm -rf node_modules package-lock.json \
    && npm install \
    && npm run build \
    && npm install -g serve

CMD ["serve", "-s", "build"]

EXPOSE 3000

