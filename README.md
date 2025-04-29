# devops-fullstack-infra-app


📘 Project: Simple Button Redirect Website
🔗 Description:
A minimal web app that displays a single button. When clicked, it redirects the user to a specified URL. This project is containerized with Docker and deployable on Kubernetes.

🛠️ Technologies Used:
HTML, CSS, JavaScript

Docker

Nginx (as static file server)

Kubernetes

📁 Project Structure:
bash
Copy
Edit
.
├── index.html               # Frontend code
├── Dockerfile               # Docker image definition
└── k8s-deployment.yaml      # Kubernetes deployment and service config
📄 index.html
html
Copy
Edit
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Simple Redirect Button</title>
  <style>
    body {
      display: flex;
      height: 100vh;
      justify-content: center;
      align-items: center;
      background-color: #f0f4f8;
      font-family: Arial, sans-serif;
    }
    button {
      padding: 12px 24px;
      font-size: 16px;
      background-color: #007BFF;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <button onclick="redirectToURL()">Go to URL</button>

  <script>
    function redirectToURL() {
      window.location.href = "https://www.example.com";
    }
  </script>
</body>
</html>
📦 Dockerfile
dockerfile
Copy
Edit
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*
COPY index.html /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
🐳 Docker Commands
bash
Copy
Edit
# Build the image
docker build -t simple-button-app .

# (Optional) Tag for Docker Hub
docker tag simple-button-app your-dockerhub-username/simple-button-app

# Push to Docker Hub
docker push your-dockerhub-username/simple-button-app
☸️ Kubernetes Deployment
k8s-deployment.yaml:
yaml
Copy
Edit
apiVersion: apps/v1
kind: Deployment
metadata:
  name: button-app-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: button-app
  template:
    metadata:
      labels:
        app: button-app
    spec:
      containers:
        - name: button-app
          image: your-dockerhub-username/simple-button-app
          ports:
            - containerPort: 80

---
apiVersion: v1
kind: Service
metadata:
  name: button-app-service
spec:
  type: NodePort
  selector:
    app: button-app
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30036
🚀 Kubernetes Commands
bash
Copy
Edit
# Apply the Kubernetes manifest
kubectl apply -f k8s-deployment.yaml

# To access the app (if using Minikube)
minikube service button-app-service

# Or open in browser
http://<NodeIP>:30036
✅ Final Output:
Button shown on browser.

On click, user is redirected to https://www.example.com.
