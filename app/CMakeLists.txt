cmake_minimum_required(VERSION 3.4.1)

add_library(app-lib SHARED
        src/main/cpp/main.cpp)

add_library(native-activity-glue STATIC
        ${ANDROID_NDK}/sources/android/native_app_glue/android_native_app_glue.c)

target_include_directories(app-lib PRIVATE
        ${ANDROID_NDK}/sources/android/native_app_glue)

add_subdirectory(../renderer ${CMAKE_CURRENT_BINARY_DIR}/renderer)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

target_link_libraries(app-lib native-activity-glue renderer android log EGL GLESv1_CM)
