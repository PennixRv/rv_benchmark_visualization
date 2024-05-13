CREATE USER IF NOT EXISTS 'exporter'@'localhost' IDENTIFIED BY 'Prometheus' WITH MAX_USER_CONNECTIONS 3;
GRANT PROCESS, REPLICATION CLIENT ON *.* TO 'exporter'@'localhost';
GRANT SELECT ON performance_schema.* TO 'exporter'@'localhost';