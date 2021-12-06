cmake_minimum_required(VERSION 3.5)

project(soem_beckhoff_drivers)

 

find_package(ament_cmake REQUIRED)
#find_package(rclcpp REQUIRED)
#find_package(rtt_ros2 REQUIRED)
#find_package(rtt_ros2_params REQUIRED)
#find_package(rtt_ros2_node REQUIRED) # Required ?
#find_package(rtt_ros2_std_msgs REQUIRED)
find_package(rtt_ros2_soem_beckhoff_drivers_msgs REQUIRED)
find_package(soem REQUIRED)
find_package(soem_master REQUIRED)
ament_export_dependencies(rosidl_default_runtime)

MESSAGE ("${soem_master_INCLUDE_DIRS} is " ${soem_master_INCLUDE_DIRS} )
include_directories(
	include
	${soem_master_INCLUDE_DIRS}
	${soem_INCLUDE_DIRS}
	
)

orocos_plugin(soem_el1xxx src/soem_beckhoff_drivers.cpp src/soem_el1xxx.cpp)

target_link_libraries(soem_el1xxx 
	${soem_LIBRARIES}
	rtt_ros2_soem_beckhoff_drivers_msgs::rtt_soem_beckhoff_drivers_msgs_typekit
	)

ament_package()


orocos_generate_package(
  DEPENDS_TARGETS rtt_ros2_interfaces
)
