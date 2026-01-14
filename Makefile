
# Variáveis de configuração
NAME		= inception
SRCS_DIR	= ./srcs
DOCKER_CONF	= $(SRCS_DIR)/docker-compose.yml
# O caminho abaixo usa o seu login da 42 conforme exigido 
DATA_PATH	= /home/jhualves/data

# Cores para o terminal (estético)
GREEN		= \033[0;32m
RED			= \033[0;31m
RESET		= \033[0m

all: build up

# Cria as pastas de volumes no host antes de subir os containers [cite: 108]
# O @ suprime a exibição do comando no terminal
build:
	@echo "$(GREEN)Criando diretórios de volumes em $(DATA_PATH)...$(RESET)"
	@sudo mkdir -p $(DATA_PATH)/mariadb
	@sudo mkdir -p $(DATA_PATH)/wordpress
	@sudo chmod 777 $(DATA_PATH)/mariadb
	@sudo chmod 777 $(DATA_PATH)/wordpress
	@echo "$(GREEN)Construindo as imagens do Docker...$(RESET)"
	@docker compose -f "$(DOCKER_CONF)" build
	@sudo chown -R www-data:www-data $(DATA_PATH)/wordpress
	@sudo chown -R www-data:www-data $(DATA_PATH)/mariadb
	@sudo chmod -R 755 $(DATA_PATH)/wordpress
	@sudo chmod -R 755 $(DATA_PATH)/mariadb
	@sudo chmod +x $(SRCS_DIR)/requirements/wordpress/tools/wp_config.sh

# Sobe os containers em modo "detached" (segundo plano)
up:
	@echo "$(GREEN)Iniciando os containers...$(RESET)"
	@docker compose -f "$(DOCKER_CONF)" up -d

# Para os containers sem removê-los
stop:
	@echo "$(RED)Parando os containers...$(RESET)"
	@docker compose -f "$(DOCKER_CONF)" stop

# Remove os containers e as redes [cite: 91, 139]
down:
	@echo "$(RED)Removendo containers e redes...$(RESET)"
	@docker compose -f "$(DOCKER_CONF)" down

# Limpeza completa (containers, imagens e redes)
clean: down
	@echo "$(RED)Limpando imagens do Docker...$(RESET)"
	@docker rmi -f $$(docker images -qa) 2>/dev/null || true
	@docker compose -f "$(DOCKER_CONF)" restart nginx

# Limpeza total: remove volumes e as pastas físicas no host [cite: 89, 90, 108]
# USE COM CAUTELA: isso apagará seu banco de dados e arquivos do WordPress
fclean: clean
	@echo "$(RED)Removendo volumes e pastas de dados...$(RESET)"
	@if [ $$(docker volume ls -q | wc -l) -gt 0 ]; then docker volume rm $$(docker volume ls -q); fi
	@sudo rm -rf $(DATA_PATH)

# Reinicia o projeto do zero
re: fclean all

.PHONY: all build up stop down clean fclean re