# Project Deployment Script

This README outlines the deployment steps and provides explanations for each part of the provided Bash deployment script.

## Overview

The provided script automates the deployment of the Remix application by installing dependencies, building the project, and restarting the PM2 process.

---

## Deployment Script

```bash
#!/bin/bash

# Display a start message
echo "Starting deployment..."

# Navigate to your project directory
cd /home/ubuntu/internal-app/internal-app2/my-remix-app || exit

# Pull latest code
echo "Pulling latest code..."
git pull origin main

# Install dependencies
echo "Running npm install..."
npm i

# Build the project
echo "Building the project..."
npm run build

# Restart PM2 process
echo "Restarting PM2 process..."
pm2 restart 0

# Display a completion message
echo "Deployment completed successfully."
```

---

## Step-by-step Explanation

### 1. Start Message

```bash
echo "Starting deployment..."
```

- Provides a clear indication that the deployment process has started.

### 2. Navigate to Project Directory

```bash
cd /home/ubuntu/internal-app/internal-app2/my-remix-app || exit
```

- Moves the script execution context into the specific directory of your Remix project.
- `|| exit` ensures the script terminates if the directory change fails.

### 3. Install Dependencies

```bash
npm i
```

- Installs the project dependencies defined in the `package.json` file.

### 4. Build the Project

```bash
npm run build
```

- Runs the build script specified in the project's `package.json`.
- Prepares the project for production by compiling assets and optimizing files.

### 5. Restart PM2 Process

```bash
pm2 restart 0
```

- Restarts the PM2 process with ID `0`.
- Ensures the application runs with the latest build.

### 6. Completion Message

```bash
echo "Deployment completed successfully."
```

- Indicates the successful completion of the deployment script.

---

## Requirements

- Node.js and npm must be installed on the deployment server.
- PM2 should be installed globally (`npm install -g pm2`).

---

## Usage

1. Make sure the script is executable:

```bash
chmod +x deploy.sh
```

2. Execute the script:

```bash
./deploy.sh
```

---

## Notes

- Adjust paths in the script according to your project’s directory structure.
- Ensure the PM2 process ID (`0`) matches the ID of your running application. Use `pm2 list` to verify.

---

## Troubleshooting

- **Build Errors:** Verify dependencies and environment variables.
- **PM2 Errors:** Check application logs using `pm2 logs` for detailed error information.
