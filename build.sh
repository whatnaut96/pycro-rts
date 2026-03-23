cd src/pycro_rts/microrts

rm -rf buid microrts.jar
mkdir build
javac -d "./build" -cp ".lib/*" -sourcepath "./src" $(find ./src/* | grep .java)
cp -a lib/. build/

rm build/weka.jar
rm -rf build/bots

cd build 
for i in *.jar; do
    echo "adding dependency $i"
    jar xf $i
done
jar cvf microrts.jar *
mv microrts.jar ../microrts.jar
cd ..
rm -rf build
