. config.conf
#Build the main data folders
mkdir -p $mongo_dbpath_root
cd $mongo_dbpath_root
mkdir -p {r1-1,r1-2,r1-3}/data

cd "$start_dir"
#Start the processes

#replSet1
for i in `seq 7 9`;do
	$bin_dir/mongod  --fork --smallfiles --logpath $mongo_dbpath_root/r1-$(($i-6))/mongo.log --dbpath $mongo_dbpath_root/r1-$(($i-6)) --port 2701${i} --replSet r1  
done


echo -e "Building ReplSet1" 
$bin_dir/mongo --quiet --port 27017 --eval "var replSet='r1'" "${start_dir}/config_replset.js"
sleep 5

echo -e "Service\t\tPortRange"
echo -e "mongod\t\t27017-27019"



