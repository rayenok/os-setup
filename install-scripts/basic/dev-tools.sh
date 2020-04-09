sudo apt-get install autotools-dev automake cscope exuberant-ctags libc6-dev python-pygments python3-dev python3-pip git vim build-essential

# Tool to generate ascii protocol diagrams
sudo git clone https://github.com/luismartingarcia/protocol.git
sudo chown -R enova:enova /opt/protocol
cd /opt/protocol/
sudo ./setup.py install
cd

