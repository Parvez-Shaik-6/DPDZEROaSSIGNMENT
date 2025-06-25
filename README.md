# 🧭 Multi-Service Reverse Proxy Setup with NGINX and Docker Compose

This project sets up **two backend services** (`service_1` in Go and `service_2` in Python) and an **NGINX reverse proxy** to route requests to each service through a single exposed port: `8000`.

---

## 📁 Folder Structure

├── customscripts/
│ └── msmtpSetup/ # Optional email setup scripts
├── nginx/
│ ├── nginx.conf # NGINX reverse proxy config
│ └── logs/ # NGINX logs
├── service_1/ # Go backend service
│ ├── main.go
│ ├── Dockerfile
│ └── README.md
├── service_2/ # Python backend (e.g. Flask)
│ ├── app.py
│ ├── Dockerfile
│ ├── pyproject.toml
│ └── README.md
├── docker-compose.yml
└── README.md # This file


---

## 🚀 How It Works

- NGINX runs on port `8000` and forwards:
  - `/service_1/` requests → Go service on port `8001`
  - `/service_2/` requests → Python/Flask service on port `8002`
- All containers share a custom Docker bridge network: `reverseProxy`
- Health checks are included for both services.

---

## 🔁 Reverse Proxy Behavior

| URL Path                 | Service           | Target Container/Port |
|--------------------------|-------------------|------------------------|
| `/service_1/`            | Go API            | `service_1:8001`       |
| `/service_2/`            | Flask API         | `service_2:8002`       |

---

## 📦 Docker Compose Setup

Run the following to build and launch all services:

```bash
docker-compose up --build

Access services from your browser or curl:

http://localhost:8000/service_1

http://localhost:8000/service_2
Each service has a /ping route for health checking:

service_1: GET http://localhost:8001/ping

service_2: GET http://localhost:8002/ping

These endpoints are automatically tested by Docker's health check system.