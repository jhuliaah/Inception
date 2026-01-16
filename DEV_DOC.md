# DEV_DOC.md - Developer Documentation

## 1. Development Environment Setup
To set up this environment from scratch:
- [cite_start]**Prerequisites**: Install Docker and Docker Compose on a Virtual Machine[cite: 19, 76].
- [cite_start]**Configuration**: Ensure a `.env` file exists in `srcs/` with all required database and WordPress variables[cite: 163, 198].
- [cite_start]**Domain**: Map `127.0.0.1` to `jhualves.42.fr` in your host's `/etc/hosts` file[cite: 110].

## 2. Build and Launch
[cite_start]The project is managed via a **Makefile** located at the root[cite: 21, 148].
- [cite_start]**Build**: `make` triggers `docker-compose.yml` to build images and start containers[cite: 22, 82].
- **Rebuild**: `make re` performs a full cleanup and restart.

## 3. Container & Volume Management
- **View Containers**: `docker ps`
- [cite_start]**Stop & Clean**: `make fclean` removes all containers, networks, and images[cite: 233].
- **Direct Access**: Use `docker exec -it <container> sh` for manual debugging.

## 4. Data Persistence & Storage
[cite_start]Data is stored on the host machine in the following directories[cite: 108]:
- [cite_start]**WordPress Files**: `/home/jhualves/data/wordpress`[cite: 90].
- [cite_start]**Database Files**: `/home/jhualves/data/mariadb`[cite: 89].

[cite_start]This persistence ensures that website content remains intact even if containers are deleted[cite: 234].

## 5. Technical Design Choices
- [cite_start]**Docker vs VM**: Docker provides lightweight process isolation compared to the hardware virtualization of VMs[cite: 213].
- [cite_start]**Network**: A dedicated bridge network is used for internal container communication, forbidding `network: host` for security[cite: 91, 99].
