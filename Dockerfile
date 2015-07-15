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

# Setup environment
ENV MAYA_LOCATION=/usr/autodesk/maya/
ENV PATH=$MAYA_LOCATION/bin:$PATH
ENV PYTHONPATH=$PYTHONPATH:/usr/lib64/python2.6/site-packages

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py

RUN mayapy -m pip install \
 nose

# Make mayapy the default Python
RUN rm -f /usr/bin/python && \
    echo alias python=/usr/autodesk/maya/bin/mayapy >> ~/.bashrc

# Cleanup
WORKDIR /root
