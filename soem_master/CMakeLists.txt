cmake_minimum_required(VERSION 3.5)

project(soem_master)


find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(rtt_ros2 REQUIRED)
find_package(rtt_ros2_params REQUIRED)
find_package(rtt_ros2_node REQUIRED) # Required ?
find_package(rtt_ros2_std_msgs REQUIRED)



orocos_use_package(ocl-deployment REQUIRED)
orocos_use_package(ocl-taskbrowser REQUIRED)


# Defines the orocos_* cmake macros. See that file for additional
# documentation.

find_package(soem REQUIRED)
include_directories(${soem_INCLUDE_DIRS})

#common commands for building c++ executables and libraries
orocos_library(soem_driver_factory soem_driver_factory.cpp)
orocos_component(soem_master soem_master_component.cpp)
target_link_libraries(soem_master soem_driver_factory ${soem_LIBRARIES})

orocos_plugin(soem_plugin soem_plugin.cpp)

orocos_install_headers( soem_driver.h soem_driver_factory.h)

install(PROGRAMS setcap.sh DESTINATION lib/${PROJECT_NAME})

ament_package()

orocos_generate_package( 
 	INCLUDE_DIRS ..
  DEPENDS_TARGETS
    rtt_ros2
    rtt_ros2_std_msgs
)

