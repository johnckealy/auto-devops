env-dev:
	$(eval include env/.env.dev)
	$(eval export $(shell sed 's/=.*//' env/.env.dev))

env-prod:
	$(eval include env/.env.prod)
	$(eval export $(shell sed 's/=.*//' env/.env.prod))

deploy-prod: env-prod build-frontend
	echo "Building ${ENVIRONMENT} Environment"
	docker-compose -f docker-compose.prod.yml up --build -d

# deploy production without -d flag for server testing
deploy-prod-nod: env-prod build-frontend
	echo "Building ${ENVIRONMENT} Environment"
	docker-compose -f docker-compose.prod.yml up --build

docker-down: env-prod
	docker-compose -f docker-compose.prod.yml down

docker-logs: env-prod
	docker-compose -f docker-compose.prod.yml logs -f

build-frontend:
	cd frontend && npm i && quasar build -m ssr

frontend-serve: env-dev
	cd frontend && quasar dev -m ssr

frontend-prod-serve: env-prod
	cd frontend/dist/ssr/ && npm run start

env-clean:
	@rm -rf node_modules frontend/node_modules
	@rm -rf package-lock.json frontend/package-lock.json
	@rm -rf frontend/dist
	@echo "Environment cleaned."
