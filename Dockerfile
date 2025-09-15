# Use a Node.js base image (node:16 is a good choice for this app).
FROM node:16

# Set the working directory inside the container to /app.
WORKDIR /app

# Copy package.json and package-lock.json to the working directory.
# This step leverages Docker's layer caching; if these files don't change,
# the dependencies won't be reinstalled on subsequent builds.
COPY package*.json ./

# Install the application dependencies as defined in package.json.
RUN npm install

# Copy all the remaining application files into the container.
COPY . .

# Expose port 3000 to the host machine.
# This is documentation of the port the container listens on.
EXPOSE 3000

# Define the command to start the application when the container launches.
CMD ["npm", "start"]