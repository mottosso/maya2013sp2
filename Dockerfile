FROM mottosso/mayabase-centos
 
MAINTAINER marcus@abstractfactory.io
 
# Download and unpack distribution first, Docker's caching
# mechanism will ensure that this only happens once.
RUN wget http://download.autodesk.com/us/maya/service_packs/Autodesk_Maya_2013_SP2_English_Linux_64bit.tgz -O maya.tgz && \
    mkdir /maya && tar -xvf maya.tgz -C /maya && \
    rm maya.tgz

# Install Maya
RUN rpm -Uvh /maya/Maya*.rpm && \
    rm -rf /maya

# Make mayapy the default Python
RUN rm -f /usr/bin/python && \
    echo alias python=/usr/autodesk/maya/bin/mayapy >> ~/.bashrc

# Setup environment
ENV MAYA_LOCATION=/usr/autodesk/maya/
ENV PATH=$MAYA_LOCATION/bin:$PATH

RUN wget https://bootstrap.pypa.io/ez_setup.py && \
    mayapy ez_setup.py && \
    git clone https://github.com/pypa/pip.git && \
    git --git-dir $(pwd)/pip/.git checkout 7.0.1 && \
    mayapy pip/setup.py install

# Cleanup
WORKDIR /root
