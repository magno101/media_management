<div id="top"></div>



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
<h3 align="center">Media Management Using Docker Compose</h3>

  <p align="center">
    A repository containing the artifacts needed in order to run a number of popular media management containers using Docker Compose.
    <br />
    <a href="https://github.com/magno101/media_management"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/magno101/media_management/issues">Report Bug</a>
    ·
    <a href="https://github.com/magno101/media_management/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#clone-repository">Clone the Repository</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#open-issues">Open Issues</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This project is meant to provide an example for any looking to setup qBittorrent, Sonarr, Radarr, and Lidarr behind a connection to the Private Internat Access VPN service. 

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)
* [colinhebert/pia-openvpn](https://github.com/ColinHebert/pia-openvpn)
* [nginx](https://hub.docker.com/_/nginx)
* [lscr.io/linuxserver/qbittorrent](https://hub.docker.com/r/linuxserver/qbittorrent)
* [lscr.io/linuxserver/lidarr](https://hub.docker.com/r/linuxserver/lidarr)
* [lscr.io/linuxserver/radarr](https://hub.docker.com/r/linuxserver/radarr)
* [lscr.io/linuxserver/sonarr](https://hub.docker.com/r/linuxserver/sonarr)


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

First things first, we need to install a few things. I performed this using Ubuntu Server 20.0.4 LTS so that's how the instructions will be scopped. I can tell you that running this on a windows host using WSL2 does not work as DNS is broken. If someone knows how to fix it please let me know.

### Prerequisites

1. [How To Install and Use Docker on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)
2. [How To Install and Use Docker Compose on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)
3. Install git
   ```sh
   apt-get install git -y
   ```

### Clone Repository
Lets clone the repository to your home folder.

   ```sh
   cd ~
   git clone https://github.com/magno101/media_management.git
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Once the repository is cloned we can get started customizing things.
1. Modify the '.env' file
   
   This is the file that contains important settings for PIA and the linuxserver containers.

   ```sh
   cd media_management
   vim .env
   ```

   The file will look something like the following:
   ```ini
   PUID=1000
   PGID=1000
   TZ=America/New_York
   PIA_USERNAME=myPIAUsername
   PIA_PASSWORD=myPIAPassword
   PIA_REGION=US New York
   ```
   You'll need to modify it to fit your environment. This repository only has configurations for US New York and US Texas, but you can download your own configurations for PIA directly and copy them to the ./custom/pia folder. They will be copied to the pia container after the init.sh script is run.

2. Run the init.sh script
   
   We need to ensure that the init.sh script is executable first.

   ```sh
   chmod +x init.sh
   ```

   Then we can run it.

   ```sh
   ./init.sh
   ```

   This script will bring up the environment and then stop the containers. Once stopped it will then copy the config files in ./custom to the respective containers, and once done it will bring the containers back up and you should be good to start using the different programs.

3. Connect to the different applications
   
   In order to connecto to the applications, you'll need to open a browser window and point it to the following:
   * http://IPAddressOfDockerHost:8888/qbittorrent/
   * http://IPAddressOfDockerHost:8888/lidarr/
   * http://IPAddressOfDockerHost:8888/sonarr/
   * http://IPAddressOfDockerHost:8888/radarr/
   
   Where IPAddressOfDockerHost is the IPv4 address of the host running the containers.


<p align="right">(<a href="#top">back to top</a>)</p>


## Open Issues

See the [open issues](https://github.com/magno101/media_management/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Marcus Canales - marcus.canales@gmail.com

Project Link: [https://github.com/magno101/media_management](https://github.com/magno101/media_management)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/magno101/media_management.svg?style=for-the-badge
[contributors-url]: https://github.com/magno101/media_management/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/magno101/media_management.svg?style=for-the-badge
[forks-url]: https://github.com/magno101/media_management/network/members
[stars-shield]: https://img.shields.io/github/stars/magno101/media_management.svg?style=for-the-badge
[stars-url]: https://github.com/magno101/media_management/stargazers
[issues-shield]: https://img.shields.io/github/issues/magno101/media_management.svg?style=for-the-badge
[issues-url]: https://github.com/magno101/media_management/issues
[license-shield]: https://img.shields.io/github/license/magno101/media_management.svg?style=for-the-badge
[license-url]: https://github.com/magno101/media_management/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/marcuscanales