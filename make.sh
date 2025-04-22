#!/bin/bash

case "$1" in
    console)
        docker compose exec php bin/console $@
        ;;
    migrate)
        docker compose exec php bin/console doctrine:migrations:migrate
        ;;
    seed)
        docker compose exec php bin/console doctrine:fixtures:load
        ;;
    run-model)
        docker compose exec "$2" /bin/bash -c "python3 /multiagent_models/netlogo/main.py"
        ;;
    *)
        echo "Usage: $0 {console|migrate|seed|run-model} <service>"
        exit 1
        ;;
esac
