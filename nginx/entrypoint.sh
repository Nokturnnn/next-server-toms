#!/bin/bash
set -e

# Initialiser le cluster de bases de données si ce n'est pas déjà fait
if [ ! -s "$PGDATA/PG_VERSION" ]; then
    su - postgres -c "/usr/lib/postgresql/14/bin/initdb -D /var/lib/postgresql/data"
    su - postgres -c "echo \"host all  all    0.0.0.0/0  md5\" >> /var/lib/postgresql/data/pg_hba.conf"
    su - postgres -c "echo \"listen_addresses='*'\" >> /var/lib/postgresql/data/postgresql.conf"
    su - postgres -c "/usr/lib/postgresql/14/bin/pg_ctl -D /var/lib/postgresql/data -o \"-c listen_addresses='*'\" -w start"
    su - postgres -c "psql --username=postgres --dbname=postgres -c \"ALTER USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';\""
    su - postgres -c "/usr/lib/postgresql/14/bin/pg_ctl -D /var/lib/postgresql/data -m fast -w stop"
fi

# Démarrer PostgreSQL
exec su - postgres -c "/usr/lib/postgresql/14/bin/postgres -D /var/lib/postgresql/data"
