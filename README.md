[![logo](https://raw.githubusercontent.com/Nobody84/docker-samba/master/logo.png)](https://www.samba.org)

# Samba

Samba docker container for samba including the Web Service Discovery host daemon [WSDD](https://github.com/christgau/wsdd) based on from dperson https://hub.docker.com/r/dperson/samba

# What has been changed

This docker image did not change the way samba is used in the original image. It just adds the WSDD python script from https://github.com/christgau/wsdd and runs it in addition to samba.

# Configure WSDD and/or SAMBA

## WSDD
To set the options for WSSD you have to use the environment variable `WSDD_PARAMETER`. For more information about the available option, please have a look at the original repository https://github.com/christgau/wsdd#options.

```
docker run -it \
-p 139:139 \
-p 445:445 \
-e WSDD_PARAMETER="-i eth0 -4" \
-d topdockercat/samba
```

## SAMBA
To set the options for SAMBA you can either use the environment variable `SAMBA_PARAMETER` or provide the option as commandline parameter to the docker container. The script will prefere the environment variable. For more information how to use and configure the samba part of this image, please have a look at the original docker page https://github.com/dperson/samba#configuration.

```
docker run -it \
-p 139:139 \
-p 445:445 \
-e SAMBA_PARAMETER="-u \"user1;pass1\" -s \"share1;/pathToShareOne;no;no;no;user1\"" \
-d topdockercat/samba
```
or
```
docker run -it \
-p 139:139 \
-p 445:445 \
-d topdockercat/samba -u "user1;pass1" -s "share1;/pathToShareOne;no;no;no;user1"
```

# Print parameter
To let the container print your parameter to the ouput you can set the environment variabel 'PRINT_PARAMETER' to 'yes'. But caution the samba usernames and passwords are also printet to the output. Make sure no unauthorized user have access to the log.
```
-e PRINT_PARAMETER="yes"
```
