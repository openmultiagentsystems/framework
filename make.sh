#!/bin/bash

# Author: Bruno Braga <brunobraga@protonmail.com>
#
# Streamlines most used commands of the project

case "$1" in
    add-test)
        docker compose exec php bin/console make:test $@
        ;;
    setup-test)
        docker compose exec php bin/console doctrine:database:drop --env=test --force
        docker compose exec php bin/console doctrine:database:create --env=test
        docker compose exec php bin/console doctrine:migrations:migrate --env=test --no-interaction
        ;;
    test)
        docker compose exec php ./vendor/bin/phpunit --testdox 
        ;;
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
        echo "Usage: $0 {setup-test|test|console|migrate|seed|run-model} <service>"
        exit 1
        ;;
esac
