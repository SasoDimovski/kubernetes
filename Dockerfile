FROM node:19-alpine3.16
WORKDIR /react-app
COPY package.json .
COPY package-lock.json .
RUN npm i
<!-- Copy the remaining React.js application folders and files from 
 the `jenkins-kubernetes` local folder to the Docker 
react-app working directory -->
COPY . .
EXPOSE 3000
CMD ["npm", "start"]