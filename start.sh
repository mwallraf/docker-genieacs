CONFIG_FILE=/app/config/config.json

sed -i "s|__MONGODB_CONNECTION_URL__|${MONGODB_CONNECTION_URL}|g" $CONFIG_FILE

if [ ! -z "$REDIS_PORT" ]; then
	sed -i "s/__REDIS_PORT__/${REDIS_PORT}/g" $CONFIG_FILE
else
	sed -i "s/__REDIS_PORT__/6379/g" $CONFIG_FILE
fi

sed -i "s/__REDIS_HOST__/${REDIS_HOST}/g" $CONFIG_FILE

if [ ! -z "$CWMP_INTERFACE" ]; then
	sed -i "s/__CWMP_INTERFACE__/${CWMP_INTERFACE}/g" $CONFIG_FILE
else
	sed -i "s/__CWMP_INTERFACE__/0.0.0.0/g" $CONFIG_FILE
fi

if [ ! -z "$CWMP_PORT" ]; then
	sed -i "s/__CWMP_PORT__/${CWMP_PORT}/g" $CONFIG_FILE
else
	sed -i "s/__CWMP_PORT__/7547/g" $CONFIG_FILE
fi

if [ ! -z "$CWMP_SSL" ]; then
	sed -i "s/__CWMP_SSL__/${CWMP_SSL}/g" $CONFIG_FILE
else
	sed -i "s/__CWMP_SSL__/false/g" $CONFIG_FILE
fi

if [ ! -z "$NBI_INTERFACE" ]; then
	sed -i "s/__NBI_INTERFACE__/${NBI_INTERFACE}/g" $CONFIG_FILE
else
	sed -i "s/__NBI_INTERFACE__/0.0.0.0/g" $CONFIG_FILE
fi

if [ ! -z "$NBI_PORT" ]; then
	sed -i "s/__NBI_PORT__/${NBI_PORT}/g" $CONFIG_FILE
else
	sed -i "s/__NBI_PORT__/7557/g" $CONFIG_FILE
fi

if [ ! -z "$FS_INTERFACE" ]; then
	sed -i "s/__FS_INTERFACE__/${FS_INTERFACE}/g" $CONFIG_FILE
else
	sed -i "s/__FS_INTERFACE__/0.0.0.0/g" $CONFIG_FILE
fi

if [ ! -z "$FS_PORT" ]; then
	sed -i "s/__FS_PORT__/${FS_PORT}/g" $CONFIG_FILE
else
	sed -i "s/__FS_PORT__/7567/g" $CONFIG_FILE
fi

if [ ! -z "$FS_IP" ]; then
	sed -i "s/__FS_IP__/${FS_IP}/g" $CONFIG_FILE
else
	sed -i "s/__FS_IP__/192.168.0.1/g" $CONFIG_FILE
fi

if [ ! -z "$LOG_INFORMS" ]; then
	sed -i "s/__LOG_INFORMS__/${LOG_INFORMS}/g" $CONFIG_FILE
else
	sed -i "s/__LOG_INFORMS__/true/g" $CONFIG_FILE
fi

if [ ! -z "$DEBUG" ]; then
	sed -i "s/__DEBUG__/${DEBUG}/g" $CONFIG_FILE
else
	sed -i "s/__DEBUG__/false/g" $CONFIG_FILE
fi

cat $CONFIG_FILE

supervisord -n
