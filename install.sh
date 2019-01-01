# Clone cirkit_unit03_pkgs repository
git clone https://github.com/MoriKen254/ntl_motoman_pkgs.git ../ntl_motoman_pkgs

cd ../../

wstool init src
wstool merge -t src src/ntl_motoman_pkgs/.kinetic_depends.rosinstall
wstool update -t src

rosdep init
rosdep update
rosdep install -i -r -y --from-paths src --ignore-src

catkin_make
source devel/setup.bash

catkin_make run_tests
catkin_test_results
