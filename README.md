# ft_server

Make sites(wordpress, phpmyadmin) with docker, mysql

<img alt="Docker" src="https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white"/> <img alt="MySQL" src="https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white"/> <img alt="WordPress" src="https://img.shields.io/badge/WordPress-%23117AC9.svg?style=for-the-badge&logo=WordPress&logoColor=white"/>

## Usage

1. Build a container on current root with tag

   `docker build . -t ft_server`

2. Run the image

   `docker run -it -p80:80 -p443:443 ft_server`

   then you can see like this

   `root@d48c6a8b2cb8:/#`

3. Start some services
   + `service nginx start`
   + `service php7.3-fpm start`
   + `servie mysql start`

4. You can access phpmyadmin, wordpress on browser

   I recommend to use safari because of chrome's security policy

   + https://localhost/wordpress
   + https://localhost/phpmyadmin

   you can sign in phpmyadmin with (id: 'root', password: '')

---

***For more details on the Wiki (not yet)***

