#!/bin/sh
read -p "Enter the name of your custom network: " net
read -p "Enter the driver name: " driver
docker network create $net --driver $driver
x=1
read -p "How many containers you want to run on $net network: " y
while [ $x -le $y ]
do
	read -p "Enter the image name to run: " img
	read -p "Enter name for container: " container
	docker run -dt --name $container --network $net $img
	read -p "Enter the command name:" cmd
	echo "Accessing $container container run your commands here:"
	docker exec -it $container $cmd
	x=`expr $x + 1`
done
