# - Try to find VulkanHpp
# Once done this will define
#  LIBVULKANHPP_FOUND - System has LibVulkanHpp
#  LIBVULKANHPP_INCLUDE_DIRS - The LibVulkanHpp include directories
#  LIBVULKANHPP_LIBRARIES - The libraries needed to use LibVulkanHpp
#  LIBVULKANHPP_DEFINITIONS - Compiler switches required for using LibVulkanHpp

find_package(PkgConfig)
pkg_check_modules(PC_LIBVULKANHPP QUIET libvulkanhpp)
set(LIB_VULKANHPP_DEFINITIONS ${PC_LIBVULKANHPP_CFLAGS_OTHER})

find_path(LIBVULKANHPP_INCLUDE_DIR vulkan/vulkan.hpp
    HINTS ${PC_LIBVULKANHPP_INCLUDEDIR} ${PC_LIBVULKANHPP_INCLUDE_DIRS})

if(NOT ${LIBVULKANHPP_INCLUDE_DIR})
    find_path(LIBVULKANHPP_INCLUDE_DIR vulkan/vulkan.hpp
        HINTS $ENV{VULKANHPP_PATH})
endif()

find_library(LIBVULKANHPP_LIBRARY vulkanhpp
    HINTS ${PC_LIBVULKANHPP_LIBDIR} ${PC_LIBVULKANHPP_LIBRARY_DIRS})

if(NOT ${LIBVULKANHPP_LIBRARY})
    find_library(LIBVULKANHPP_LIBRARY vulkanhpp
        HINTS $ENV{VULKANHPP_PATH}/lib)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibVulkanHpp DEFAULT_MSG
    LIBVULKANHPP_LIBRARY LIBVULKANHPP_INCLUDE_DIR)

mark_as_advanced(LIBVULKANHPP_INCLUDE_DIR LIBVULKANHPP_LIBRARY)

set(LIBVULKANHPP_LIBRARIES ${LIBVULKANHPP_LIBRARY})
set(LIBVULKANHPP_INCLUDE_DIRS ${LIBVULKANHPP_INCLUDE_DIR})
