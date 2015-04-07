if [ $# -lt 1 ]; then
    echo "Provide this argument : [Source location]"
    exit 1
fi
docker run -v $1:/source --rm=true fdickey/darkstar-dev /bin/sh -c "cd /source && sh ./autogen.sh && ./configure LIBS=-lpthread && make -j24"
