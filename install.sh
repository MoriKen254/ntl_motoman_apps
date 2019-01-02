#git clone https://github.com/MoriKen254/ntl_motoman_pkgs.git ../ntl_motoman_pkgs

cd ../../

# install dependent non-apt packages via wstool
wstool init src
wstool merge -t src src/ntl_motoman_apps/.kinetic_depends.rosinstall
wstool update -t src

# install dependent apt packages via wstool
rosdep init
rosdep update
rosdep install -i -r -y --from-paths src --ignore-src

# build
catkin_make
source devel/setup.bash

# test
catkin_make run_tests
catkin_test_results
