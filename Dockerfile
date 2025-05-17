# This Dockerfile is for a simple Python web application that uses Flask and Prometheus for monitoring.
# It sets up a lightweight Python environment, installs the necessary dependencies, and exposes the application on port 5000.
# From the base image, it copies the requirements file and installs the dependencies.
# It then copies the rest of the application code into the container and exposes port 5000 for the web server.
# The application can be run using the command `python app.py`.
# Use a lightweight Python image as the base image. This helps to keep the image size small and efficient.
FROM python:3.9-slim-buster
# Set the working directory in the container to /app. This is where the application code will be copied.
# This helps to keep the container organized and makes it easier to manage files. 
WORKDIR /app 
# Copy the requirements.txt file into the container. This file contains the list of dependencies needed for the application.
# This allows the container to install the necessary packages without needing to copy the entire application code first.
COPY requirements.txt .
# Install the dependencies listed in requirements.txt. The --no-cache-dir option prevents pip from caching the packages, which helps to reduce the image size.
# This ensures that the application has all the necessary libraries and packages to run correctly.
RUN pip install --no-cache-dir -r requirements.txt
# Copy the rest of the application code into the container. This includes the main application file and any other necessary files.
# This step is important to ensure that the application has all the necessary code to function properly.
COPY . .
# Set the environment variable FLASK_APP to the name of the main application file. This tells Flask which file to run when starting the application.
# This is important for Flask to know which application to serve.
ENV FLASK_RUN_HOST=0.0.0
# Set the environment variable FLASK_RUN_PORT to 5000. This specifies the port on which the Flask application will run.
# This is important for the application to be accessible from outside the container.
EXPOSE 5000
# Start the Flask application using the command `flask run`. This runs the application and makes it accessible on the specified host and port.
# This is the final step to run the application and make it available for use.
CMD [ "flask", "run" ]
# Note: The application code should include the necessary imports and configurations for Flask and Prometheus to work correctly.
# The requirements.txt file should include the necessary packages, such as Flask and Prometheus client libraries.

