cmake_minimum_required(VERSION 3.4.1)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

add_library(renderer SHARED
    src/main/cpp/renderer.cpp)

target_link_libraries(renderer vulkan)

