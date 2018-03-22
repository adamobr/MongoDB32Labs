. config.conf 
if [ -z $mongo_dbpath_root ]
then
	echo "BAILING! - dbpath was empty would have removed /"
	exit 255
fi

rm -rf ${mongo_dbpath_root}/* ${start_dir}/config_dump ${start_dir}/mongo*.tar ${start_dir}/mongo*.tgz
killall mongos mongod
rm -rf ${start_dir}/3.6 
