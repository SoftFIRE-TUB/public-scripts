export LC_ALL=C

mkdir -p ~/data/configdb

screen -d -m -S config mongod --configsvr --smallfiles --port $port --dbpath ~/data/configdb

while ! nc -z localhost $port; do   
	  sleep 0.5 # wait for 1/10 of the second before check again
done

echo "mongodb config is running"

# just for security.....
sleep 3
