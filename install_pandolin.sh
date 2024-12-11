# Create ignored folder for Pangolin
mkdir pangolin_clone
echo "pangolin_clone" >> .gitignore

cd pangolin_clone

# Git clone repo
git clone --recursive https://github.com/stevenlovegrove/Pangolin.git

# Dry-run of recommended deps
./scripts/install_prerequisites.sh --dry-run recommended

# Install recommended deps
./scripts/install_prerequisites.sh recommended

# Make using Ninja
cmake -B build -GNinja
cmake --build build

cd ..
