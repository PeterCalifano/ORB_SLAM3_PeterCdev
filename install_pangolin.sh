# Create ignored folder for Pangolin
mkdir pangolin_clone
echo "pangolin_clone" >> .gitignore

cd pangolin_clone

# Install catch2 if not available from apt
git clone https://github.com/catchorg/Catch2.git
cd Catch2
cmake -Bbuild -H. -DBUILD_TESTING=OFF
sudo cmake --build build/ --target install 

# Git clone repo
cd ..
git clone --recursive https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin

sudo apt install libgl1-mesa-dev libegl1-mesa-dev libglu1-mesa-dev freeglut3-dev mesa-utils libepoxy-dev

# Dry-run of recommended deps
./scripts/install_prerequisites.sh --dry-run recommended

# Install recommended deps
./scripts/install_prerequisites.sh recommended

# Make using Ninja
cmake -B build -GNinja
cmake --build build 
sudo make install -B build
cd ..
