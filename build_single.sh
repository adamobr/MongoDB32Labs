. config.conf
#Build the main data folders
mkdir -p $mongo_dbpath_root
cd $mongo_dbpath_root
mkdir -p single/data

cd "$start_dir"
#Start the processes


$bin_dir/mongod --fork --smallfiles --logpath $mongo_dbpath_root/single/mongo.log --dbpath $mongo_dbpath_root/single/data --port 27016

sleep 5

echo -e "Service\t\tPortRange"
echo -e "mongod single instance \t\t27016"
echo -e "use mongo --port 27016 to connect"

$bin_dir/mongo --port 27016




