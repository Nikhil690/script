#https://raw.githubusercontent.com/Nikhil690/script/main/NFs.sh
#!/bin/bash

sudo apt update

git clone https://gitlab.eurecom.fr/oai/cn5g/oai-cn5g-amf.git -b pre-release-2.0
git clone https://gitlab.eurecom.fr/oai/cn5g/oai-cn5g-ausf.git -b pre-release-2.0
git clone https://gitlab.eurecom.fr/oai/cn5g/oai-cn5g-nrf.git -b pre-release-2.0
git clone https://gitlab.eurecom.fr/oai/cn5g/oai-cn5g-nssf.git -b pre-release-2.0
git clone https://gitlab.eurecom.fr/oai/cn5g/oai-cn5g-nwdaf.git -b pre-release-2.0
git clone https://gitlab.eurecom.fr/oai/cn5g/oai-cn5g-pcf.git -b pre-release-2.0
git clone https://gitlab.eurecom.fr/oai/cn5g/oai-cn5g-smf.git -b pre-release-2.0
git clone https://gitlab.eurecom.fr/oai/cn5g/oai-cn5g-udm.git -b pre-release-2.0
git clone https://gitlab.eurecom.fr/oai/cn5g/oai-cn5g-udr.git -b pre-release-2.0
git clone https://gitlab.eurecom.fr/oai/cn5g/oai-cn5g-upf.git -b pre-release-2.0

cd ~/oai-cn5g-amf
git submodule init
git submodule update

cd ~/oai-cn5g-ausf
git submodule init
git submodule update

cd ~/oai-cn5g-nrf
git submodule init
git submodule update

cd ~/oai-cn5g-nssf
git submodule init
git submodule update

cd ~/oai-cn5g-nwdaf
git submodule init
git submodule update

cd ~/oai-cn5g-pcf
git submodule init
git submodule update

cd ~/oai-cn5g-smf
git submodule init
git submodule update

cd ~/oai-cn5g-udm
git submodule init
git submodule update

cd ~/oai-cn5g-udr
git submodule init
git submodule update

cd ~/oai-cn5g-upf
git submodule init
git submodule update

