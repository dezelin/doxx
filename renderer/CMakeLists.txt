cmake_minimum_required(VERSION 3.4.1)

add_library(renderer SHARED
    src/main/cpp/renderer.cpp)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

