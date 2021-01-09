# Prestashop - Docker - Nginx - PHP7.2
* Mysql DB should be in a external container or host. 

* If you have any issue with permissions just do this:

```$bash
sudo chmod -R 777 prestashop/
```
* In the docker-compose.dev remove the network part.

* If you want to install this local don't forget to modify your local DNS in /etc/hosts 
in order to user the same virtual host as docker-compose.dev.yml

# Steps

* Pull this repo and get inside the prestashop folder.
* build the image.
```$bash
docker-compose -f docker-compose.dev.yml build
```

* Run the app.
```$bash
docker-compose -f docker-compose.dev.yml up -d
```

* Open the browser on your virtual host, in my case the one below.
```$bash
http://prestashop.cuba-web.develop
```

* The action above will launch the prestashop installer.
```$bash
sudo chmod -R 777 prestashop/
```

* change name from admin folder to admins.

* This example is working here: https://tienda.cuba-web.com

# Important
* This still a work in progress. 
* Any help is welcome. 
