### 1. `USER_DOC.md`

This file is for end-users or administrators to understand and manage the service stack.

```markdown
# USER_DOC.md - User Documentation

*This project has been created as part of the 42 curriculum by jhualves.*

## 1. Provided Services
The infrastructure provides a containerized web environment consisting of:
- [cite_start]**NGINX**: Secure web server using TLS v1.2/v1.3 protocols[cite: 86, 120].
- [cite_start]**WordPress**: Content Management System for building and managing websites[cite: 87].
- [cite_start]**MariaDB**: Relational database for storing all WordPress data[cite: 88].

## 2. Getting Started
### Starting the Project
To launch the entire infrastructure, run the following command in the root directory:
```bash
make

```

### Stopping the Project

To stop the services without deleting your data:

```bash
make down

```

## 3. Accessing the System

* 
**Website**: Navigate to [https://jhualves.42.fr](https://www.google.com/search?q=https://jhualves.42.fr).


* 
**Admin Panel**: Go to [https://jhualves.42.fr/wp-admin](https://www.google.com/search?q=https://jhualves.42.fr/wp-admin) to manage content.
*Note: You must accept the self-signed SSL certificate warning in your browser to proceed.*



## 4. Credential Management

All usernames and passwords are managed through the `.env` file located in the `srcs/` folder.

* Locate your admin and user credentials within this file.


* 
**Important**: Do not share or commit this file to public repositories.



## 5. System Health Check

To ensure all services are running correctly, use:

```bash
docker ps

```

All containers should show a status of `Up`. To view real-time logs for troubleshooting, use `docker logs <container_name>`.

4. Summary Table for Documentation
list Users:
docker exec -it wordpress php wp-cli.phar user list --allow-root
Check Services:
docker ps
View Logs:
docker logs <container_name>