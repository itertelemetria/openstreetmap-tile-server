#!/bin/bash
# Initialize PostgreSQL and Apache
service postgresql start
service apache2 restart

# Configure renderd threads
sed -i -E "s/num_threads=[0-9]+/num_threads=${THREADS:-4}/g" /usr/local/etc/renderd.conf
# Run
sudo -u renderer renderd -f -c /usr/local/etc/renderd.conf