# Prestashop - Docker - Nginx - PHP7.2

* I'll use this repo as a boilerplate for the next projects,
probably some stuff here are not necessary for you, like 
docker networks etc, feel free to fork this 
and adjust it to your requirements.

* Mysql DB should be in an external container or host. 

* If you have any issue with permissions just do this:

```$bash
sudo chmod -R 777 prestashop/
```
* In the docker-compose.dev remove the network part.

* If you want to install this local, don't forget to modify your local DNS in /etc/hosts 
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

# SSL and HTTPS
* In my case I'm using letsencrypt-nginx-proxy to handle
https connections. In order to activate this on prestashop I
had to go into the DB and on the table ps_configuration:
```$bash
Change:

PS_SSL_ENABLED to 1
PS_SSL_ENABLED_EVERYWHERE to 1
```

* After this I took a look at the nginx-conf and checked:
```$bash
fastcgi_param HTTPS on;
```
* If you don't need https just don't do the 2 steps above. And
check that:
```$bash
fastcgi_param HTTPS off;
```
