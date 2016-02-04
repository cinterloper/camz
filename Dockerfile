FROM example/baseimage
RUN rpmkeys --import "http://rpmfusion.org/keys?action=AttachFile&do=get&target=RPM-GPG-KEY-rpmfusion-free-fedora-22" "http://rpmfusion.org/keys?action=AttachFile&do=get&target=RPM-GPG-KEY-rpmfusion-nonfree-fedora-22"
RUN dnf -y install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-22.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-22.noarch.rpm
RUN dnf -y groupinstall "development tools"  
RUN dnf -y install lz4 lzo lz4-devel lzo-devel libjpeg-turbo-devel libjpeg-turbo ffmpeg-devel ffmpeg
RUN git clone https://github.com/hyperbolic2346/motion.git 
RUN cd motion; ./configure; make -j3; make install
ADD supervisord.conf /etc/supervisord.conf
