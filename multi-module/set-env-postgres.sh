if [ -z "$DOCKER_HOST_IP" ] ; then
    if [ -z "$DOCKER_HOST" ] ; then
      export DOCKER_HOST_IP=`hostname   `
    else
      echo using ${DOCKER_HOST?}
      XX=${DOCKER_HOST%\:*}
      export DOCKER_HOST_IP=${XX#tcp\:\/\/}
    fi
fi

echo DOCKER_HOST_IP is $DOCKER_HOST_IP

export SPRING_DATASOURCE_URL=jdbc:postgresql://${DOCKER_HOST_IP}/eventuate
export SPRING_DATASOURCE_USERNAME=eventuate
export SPRING_DATASOURCE_PASSWORD=eventuate
export SPRING_DATASOURCE_DRIVER_CLASS_NAME=org.postgresql.Driver
export SPRING_DATASOURCE_TEST_ON_BORROW=true
export SPRING_DATASOURCE_VALIDATION_QUERY="SELECT 1"
export EVENTUATELOCAL_KAFKA_BOOTSTRAP_SERVERS=$DOCKER_HOST_IP:9092
export EVENTUATELOCAL_ZOOKEEPER_CONNECTION_STRING=$DOCKER_HOST_IP:2181
export EVENTUATELOCAL_CDC_POLLING_INTERVAL_IN_MILLISECONDS=500
export EVENTUATELOCAL_CDC_MAX_EVENTS_PER_POLLING=1000
export EVENTUATELOCAL_CDC_MAX_ATTEMPTS_FOR_POLLING=100
export EVENTUATELOCAL_CDC_POLLING_RETRY_INTERVAL_IN_MILLISECONDS=500
export ELASTICSEARCH_HOST=$DOCKER_HOST_IP
export ELASTICSEARCH_PORT=9300
export TODO_SERVICE_PORT=8081
export TODO_VIEW_SERVICE_PORT=8082
export TODO_SERVICES_HOST=${DOCKER_HOST_IP}
