# 🧭 Multi-Service Reverse Proxy Setup with NGINX and Docker Compose

This project sets up **two backend services** (`service_1` in Go and `service_2` in Python) and an **NGINX reverse proxy** to route requests to each service through a single exposed port: `8000`.

---

## 📁 Folder Structure

```text
.
├── customscripts/
│   └── msmtpSetup/
│       ├── .msmtprc
│       └── check.sh
├── nginx/
│   ├── nginx.conf             # Reverse proxy configuration
│   └── logs/                  # NGINX log directory
├── service_1/
│   ├── main.go                # Go app entry point
│   ├── Dockerfile             # Dockerfile for service_1
│   ├── .dockerignore
│   └── README.md
├── service_2/
│   ├── app.py                 # Flask app
│   ├── Dockerfile             # Dockerfile for service_2
│   ├── pyproject.toml
│   ├── uv.lock
│   ├── .dockerignore
│   └── README.md
├── .gitignore
├── docker-compose.yml         # Compose file to run all services
└── README.md                  # You're reading it



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

use the following url to run compose setup

https://raw.githubusercontent.com/Parvez-Shaik-6/DPDZEROaSSIGNMENT/refs/heads/URL/docker-compose.yml

docker-compose -f https://raw.githubusercontent.com/Parvez-Shaik-6/DPDZEROaSSIGNMENT/refs/heads/URL/docker-compose.yml


