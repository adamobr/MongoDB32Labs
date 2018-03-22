mkdir -p 3.6
uname -a | grep 'Darwin' 2>&1 >/dev/null
if [ $? -eq 0  ]
then 
	echo "Downloading Binaries for OSX"
	wget -q --show-progress https://fastdl.mongodb.org/osx/mongodb-osx-ssl-x86_64-3.6.3.tgz 
	
	echo -e "Decompressing downloads"
	gzip -d mongodb-osx-ssl-x86_64-3.6.3.tgz
	tar xf mongodb-osx-ssl-x86_64-3.6.3.tar -C 3.6 --strip-components=1
        
	echo "Cleaning up compressed files"
	rm mongodb-osx-ssl-x86_64-3.6.3.tar

else 
	
	echo "Downloading Binaries for Linux x86_64 generic"
	wget --help | grep show-progress > /dev/null 
	if [ "$?" -eq 0 ]
		then
		wget -q --show-progress https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.6.3.tgz
	else
		wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.6.3.tgz                
	fi

	echo "Decompressing downloads"
	gzip -d mongodb-linux-x86_64-3.6.3.tgz
	tar xf mongodb-linux-x86_64-3.6.3.tar -C 3.6 --strip-components=1
 	
	echo "Cleaning up compressed files"
	rm mongodb-linux-x86_64-3.6.3.tar        
fi


