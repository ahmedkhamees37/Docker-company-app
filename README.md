# 🚀 Company Management System

## 📌 Overview
This project is a **Java-based Company Management System** packaged as a Docker container. It includes a GUI built using Java Swing, requiring an X11 display or a virtual framebuffer (Xvfb) for execution in a headless environment.

## 🌟 Features
- 🖥️ Java application with a GUI interface
- 🐳 Runs inside a Docker container
- 🎭 Supports headless execution using Xvfb
- 🚀 Easily deployable with Docker

## 🛠️ Getting Started
### 📌 Prerequisites
- ✅ Install [Docker](https://docs.docker.com/get-docker/)
- ✅ Ensure you have access to Docker Hub

### 🔽 Pull the Docker Image
You can pull the pre-built Docker image from Docker Hub:
```sh
docker pull ahmedkhamis1/company-app
```

### ▶️ Run the Application
To start the application, use the following command:
```sh
docker run -p 8080:8080 ahmedkhamis1/company-app
```
This will:
- ✅ Start the container
- 🌐 Expose the application on port `8080`

### 🏗️ Building the Image Locally
If you want to build the Docker image yourself:
```sh
docker build -t company-app .
```
Then, run it:
```sh
docker run -p 8080:8080 company-app
```

## 📜 Dockerfile Overview
The Dockerfile includes:
- ☕ OpenJDK 17 as the base image
- 🖥️ Installation of required X11 libraries for GUI support
- 🖥️ Configuration of Xvfb for headless execution

## 🗄️ Database Setup
This project includes a SQL database dump file (`company.sql`). If you need to import it into MySQL:
```sh
mysql -u root -p company_db < company.sql
```
Ensure that:
- 🏦 MySQL server is running
- 🗃️ The `company_db` database exists

## 🤝 Contribution
Feel free to fork this project and submit pull requests! 🛠️

## 📜 License
This project is licensed under the **MIT License**.

## 📧 Contact
For any questions or issues, please reach out to **Ahmed Khamis**. ✉️

