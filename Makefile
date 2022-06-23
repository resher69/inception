SRCS	=	srcs/docker-compose.yml

all:	up

up:
	mkdir -p /home/agardet/data/db
	mkdir -p /home/agardet/data/wp
	docker-compose -f $(SRCS) up --build -d
down:
	docker-compose -f $(SRCS) down

ps:
	docker-compose -f $(SRCS) ps

top:
	docker-compose -f $(SRCS) top
clean:
	docker-compose -f $(SRCS) down --rmi all
fclean:
	docker-compose -f $(SRCS) down --rmi all -v
	rm -rf /home/agardet/data/

prune:	fclean
	docker system prune -f --all --volumes

.PHONY:	all up down ps top clean fclean prune