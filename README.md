This dockerfile builds an image of [gost](https://github.com/ginuerzh/gost) based on alpine and the image size is 5M.
***
#### Quick Start
This image uses ENTRYPOINT to run the containers as an executable.  
`docker run -d -p 8080:8080 mixool/alpine-gost -L=:8080`
***
#### Create shadowsocks server and client:
* shadowsocks server  
`docker run -d -p 8080:8080 mixool/alpine-gost -L=ss://aes-128-cfb:password@:8080`
* shadowsocks client  
`docker run -d -p 8080:8080 --net=host mixool/alpine-gost -L=:8080 -F=ss://aes-128-cfb:password@s_ip:8080`  
then try with cURL:  
`curl -x 127.0.0.1:8080 https://myip.today`
***
#### Deploy in [app.arukas.io](https://app.arukas.io/):
* 8080-TCP|CMD `-L=:8080` 
    * client: chrome+switchyomega HTTPS Endpoint:443
    * gost client: `-L=:8080 -F=socks5://s_ip:s_port`
* 8088-UDP|CMD `-L=http2+kcp://:8088`
    * gost client: -L=:8080 -F=http2+kcp://s_ip:s_port
* 8080-TCP,8088-UDP,8338-tcp|CMD `-L=:8080 -L=http2+kcp://:8088 -L=ss://aes-128-cfb:password@:8338`
    * client: shadowsocks client
    * gost client: `-L=:8080 -F=?`
***
#### More
Download: [gost client](https://github.com/ginuerzh/gost/releases)  
For more details: [&copy;blog](https://mixool.blogspot.ca/2017/04/dockergost.html)  
For more command line options, refer to: [github/gost](https://github.com/ginuerzh/gost)  
