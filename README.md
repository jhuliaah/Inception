# Inception - 42 Project

A comprehensive System Administration project focused on infrastructure virtualization using **Docker** and **Docker Compose**. This project involves building a small-scale, secure, and automated web infrastructure from scratch.

## 🚀 Getting Started

Ensure you have **Docker** and **Docker Compose** installed on your host system (Debian/WSL2).

### 1. Domain Configuration
Map the project domain to your local machine in the hosts file (Linux/VM: `/etc/hosts` or Windows: `C:\Windows\System32\drivers\etc\hosts`):
```text
127.0.0.1  jhualves.42.fr

```

### 2. Data Persistence

The project uses local bind mounts for volumes. Create the required directories on your host to store database and website files:

```bash
mkdir -p ~/data/mariadb
mkdir -p ~/data/wordpress

```

### 3. Environment Variables

Create a `.env` file in the root directory. This file is crucial for the "Zero Interaction" setup. **Do not commit this file to your repository.**

```env
DOMAIN_NAME=jhualves.42.fr

# MariaDB Credentials
DB_NAME=wordpress
DB_USER=your_user
DB_PASSWORD=your_db_password
DB_ROOT_PASSWORD=your_root_password

# WordPress Credentials
WP_USER=your_admin_name
WP_PASS=your_admin_password
WP_MAIL=your_email@student.42.fr

# Secondary WordPress User (Mandatory)
WP_USER2=author_name
WP_PASS2=author_password
WP_MAIL2=author_email@student.42.fr

```

### 4. Build and Run

Execute the following command to build the images and launch the containers:

```bash
make

```

## 🛠 Infrastructure Overview

The project deploys three main services running on a dedicated bridge network (`inception`):

* **NGINX**: Configured as a TLS proxy (TLS v1.2/v1.3) and the sole entry point via port 443.
* **MariaDB**: An SQL database that stores site data, users, and configurations.
* **WordPress + PHP-FPM**: The content management system. PHP-FPM processes the site logic, while **WP-CLI** handles the automated setup.

## ⚙️ Automation (Zero Interaction)

The core requirement of Inception is total automation. The `wp_config.sh` script performs the following tasks without manual input:

1. Waits for MariaDB to be healthy and ready for connections.
2. Downloads the WordPress core files.
3. Generates the `wp-config.php` file dynamically using the `.env` variables.
4. Installs the site and creates a secondary "Author" user as required by the 42 subject.
5. Configures optional features like Redis Cache if bonus requirements are met.

## 🧹 Maintenance Commands

* **Stop and Remove Containers:** `make down`
* **Full Cleanup (Containers, Images, Networks, Volumes):** `make fclean`
* **Rebuild Everything:** `make re`

---

*Developed by jhualves as part of the 42 Network curriculum.*

```

---

### Final Delivery Tips:

* **Permissions**: Ensure your `wp_config.sh` and `setup.sh` are marked as executable in your repository (`chmod +x`).
* **The "make re" Test**: Run `make fclean` followed by `make` one last time. If you can access `https://jhualves.42.fr` and see the blog home page immediately (without being asked for a language or database name), you are ready for the 100/100 grade.
* **SSL Warning**: During the evaluation, remind the peer that the "Connection not secure" warning is expected because the SSL certificate is self-signed.

**Would you like me to help you double-check the `fclean` rule in your Makefile to ensure it properly deletes the data folders on the host?**

```
