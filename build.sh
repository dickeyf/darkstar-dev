if [ $# -lt 2 ]; then
    echo "Provide these arguments : [Source location] [output location]"
    exit 1
fi
docker run -v $1:/source --rm=true fdickey/darkstar-dev /bin/sh -c "cd /source && sh ./autogen.sh && ./configure LIBS=-lpthread && make -j24"
cp -rf $1/* $2/
cd $2
rm -rf src
rm -rf lib*
rm -rf *dll
rm -rf win32
rm -rf *sh
rm -rf Makefile*
rm -rf configure*
rm -rf aclocal*
rm -rf autom*
rm -rf config.*
rm -rf *.am
rm -rf *.o
rm -rf .deps
rm -rf .git
rm -rf .gitignore
rm depcomp
rm missing
cd ..
tar -jcvf darkstar.tar.bz2 $2
cp -f darkstar.tar.bz2 $2/
