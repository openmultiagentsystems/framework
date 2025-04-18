#!/bin/bash

exec_cmd() {
    docker compose exec "$@"
}

console() {
    exec_cmd "$1" bin/console
}

migrate() {
    exec_cmd "$1" bin/console doctrine:migrations:migrate
}

seed() {
    exec_cmd "$1" bin/console doctrine:fixtures:load
}

run-model() {
    exec_cmd "$1" /bin/bash -c "python3 /multiagent_models/netlogo/main.py"
}

case "$1" in
    console)
        console "$2"
        ;;
    migrate)
        migrate "$2"
        ;;
    seed)
        seed "$2"
        ;;
    run-model)
        run-model "$2"
        ;;
    *)
        echo "Usage: $0 {console|migrate|seed|run-model} <service>"
        exit 1
        ;;
esac
