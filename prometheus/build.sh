docker build --network host --compress  -t gabrielmilan/prometheus:latest .
docker build --network host --compress  -t gabrielmilan/prometheus:$1 .
