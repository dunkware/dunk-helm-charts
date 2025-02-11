# ⛵ **Dunkware Helm Charts**  

Pre-configured **Helm charts** designed to make **deployment easier** while leveraging a **local storage provider** for **persistent volume claims (PVCs)**. These charts work **out of the box** with a simple `deploy.sh` script in each chart directory.

## 🚀 **Features**
- **Pre-configured Kubernetes deployments** for common services.  
- **Uses Local Storage Provisioner** to map **persistent volumes** to the local file system.  
- **Simple deployment** using `deploy.sh` scripts included in each chart.  
- **Works in local Kubernetes environments** for easy testing and development.

## 📦 **Included Helm Charts**
| Chart | Description |
|-------|------------|
| **Kafka** | Distributed event streaming platform |
| **Elastic Stack** | Logging, metrics, and search (Elasticsearch, Logstash, Kibana) |
| **Kubernetes Dashboard** | Web UI for Kubernetes management |
| **Cassandra** | Scalable NoSQL database |
| **MySQL** | Relational database management system |
| **Redis** | High-performance in-memory key-value store |
| **Redis Cluster** | Scalable and distributed Redis setup |
| **Keycloak** | Open-source identity and access management |
| **Local Storage Provisioner** | Enables local storage-backed persistent volumes |

## ⚡ **Getting Started**
### **1️⃣ Clone the Repository**
```sh
git clone git@github.com:dunkware/helm-charts.git
cd helm-charts
