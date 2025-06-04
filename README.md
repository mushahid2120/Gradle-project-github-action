# Gradle Java DevOps Project with GitHub Actions

This repository contains a Gradle-based Java application with a complete CI/CD pipeline implemented using GitHub Actions. The pipeline automates testing, security scanning, static code analysis, artifact publishing to Nexus, and Docker image creation and deployment.


![logo](https://github.com/user-attachments/assets/44dac312-7f5f-4f53-8e9b-0ff3d800a1c8)


---

    gradle-java-devops/
    ├── src/                     # Source code
    ├── build.gradle             # Gradle build file
    ├── Dockerfile               # Dockerfile for building container
    ├── .github/workflows/      # GitHub Actions workflows
    ├── settings.gradle          # Gradle settings
    └── README.md                # Project documentation

## Features

- **Gradle Build**: Uses Gradle for building and packaging the Java application.
- **Security Scanning**: Integrates Trivy to scan both filesystem and Docker images.
- **Static Analysis**: Performs SonarQube analysis on the codebase.
- **Artifact Deployment**: Publishes built JAR files to a Nexus repository.
- **Containerization**: Builds and pushes Docker images to Docker Hub.
- **CI/CD Automation**: Pipeline managed with GitHub Actions.

## How to Run the Project Locally

### Step 1: Clone the Repository
```bash
git clone https://github.com/your-org/gradle-java-devops.git
cd gradle-java-devops
```

### Step 2: Build the Project
```bash
./gradlew clean build
```

### Step 3: Run the Application
```bash
java -jar build/libs/your-app.jar
```

### Step 4: Build Docker Image
```bash
docker build -t mushahid144/gradle-app:latest .
```

### Step 5: Run Docker Container
```bash
docker run -p 8080:8080 mushahid144/gradle-app:latest
```

## GitHub Actions Workflow Summary

The pipeline is triggered manually using `workflow_dispatch` and includes the following jobs:

### 1. gradle-build
- Checks out code
- Sets up Java 17
- Runs unit tests with Gradle

### 2. trivy-scan-fs
- Performs Trivy filesystem scan

### 3. sonar-scan
- Checks out code
- Performs static code analysis using SonarQube
- Requires `SONAR_TOKEN` and `SONAR_HOST_URL` secrets

### 4. push-to-nexus
- Builds project artifacts using `gradle assemble`
- Publishes to Nexus
- Requires `NEXUS_USERNAME` and `NEXUS_PASSWORD` for authentication

### 5. docker-build-push
- Downloads artifact from Nexus
- Builds Docker image
- Runs Trivy image scan
- Pushes image to Docker Hub
- Requires `DOCKERHUB_USERNAME` (var) and `DOCKERHUB_PASSWORD` (secret)

## Improvements and Future Enhancements

- Add deployment to Kubernetes cluster via GitHub Actions.
- Automate release tagging and versioning.
- Integrate Slack or Teams for pipeline notifications.
- Extend testing with integration and E2E tests.

---


