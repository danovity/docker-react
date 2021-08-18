# Specify a base image
FROM node:alpine as builder
# Specify the work directory
WORKDIR '/app'
# Install some dependencies
COPY package.json .
RUN npm install
COPY . .
# Default command
RUN npm run build
# a build folder will be created under the app folder


FROM nginx
# command that copies over the build folder
# --from=builder, means copy over from another phase
COPY --from=builder /app/build /usr/share/nginx/html
