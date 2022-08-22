cmake_minimum_required(VERSION 3.5)

project(soem_beckhoff_drivers_msgs)


find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)

  rosidl_generate_interfaces(${PROJECT_NAME}
    msg/AnalogMsg.msg
    msg/CommMsgBig.msg
    msg/CommMsg.msg
    msg/DigitalMsg.msg
    msg/EncoderMsg.msg
    msg/EncoderInMsg.msg
    msg/EncoderOutMsg.msg
    msg/PSUMsg.msg
    )
ament_export_dependencies(rosidl_default_runtime)

ament_package()



