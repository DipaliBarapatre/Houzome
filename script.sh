db() {
	docker run -P --name postgres_db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -d -t postgres:latest 
}

app() {
	docker run -p 3000:3000 --link postgres_db:postgres_database --name interia sidtri/interia
}

action=$1

${action}