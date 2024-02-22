# Running Dockerized LAMP Stack Application

This guide provides step-by-step instructions on how to run a Dockerized LAMP (Linux, Apache, MySQL, PHP) stack application.

## Prerequisites

Before you begin, ensure you have Docker and Docker Compose installed on your system.

## Steps

1. **Clone the Repository**: Clone the repository containing your Dockerized LAMP stack application.

   ```bash
   git clone <repository_url>
   ```
2. **Navigate to the Project Directory**: Change directory to the root directory of your project.
   ```
   cd <project_directory>
   ```
3. **Update Application Configuration**: If necessary, update your application configuration to connect  to the MySQL database container using the service name defined in the Docker Compose file (db).  
4. **Build and Run Docker Containers**:Run the following command to build and run the Docker containers defined in the docker-compose.yml file.
   ```
   docker-compose up --build
   ```
5. **Access the Application**: Once the containers are up and running, you can access your LAMP stack application in a web browser by navigating to ```http://localhost```
6. **Stopping the Application**: To stop the running Docker containers, use the following command
   ```
   docker-compose down
   ```
### Additional Notes
If you need to make changes to your application code or Docker configuration, you can rebuild the containers using the docker-compose up --build command.
Ensure that your application is correctly configured to work with the MySQL database container using the appropriate hostname, port, username, and password     
