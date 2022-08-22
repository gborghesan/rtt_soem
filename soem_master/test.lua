require "rttlib"
-- require "rttros"
require "os"

-- ------------------------------------------ --
-- Get the deployer and the necessary imports --
-- ------------------------------------------ --

-- get the deployer
tc=rtt.getTC()
if tc:getName() == "lua" then
  dep=tc:getPeer("Deployer")     
elseif tc:getName() == "Deployer" then
  dep=tc
end

-- do the necessary imports
dep:import("ocl")
dep:import("rtt_ros2_std_msgs")
dep:import("rtt_ros2")
dep:import("rtt_ros2_node")
rtt.provides("ros"):import("soem_master")

dep:loadComponent("master","soem_master::SoemMasterComponent")
master = dep:getPeer("master")
master:setPeriod(0.01)
master:configure()
master:start()
