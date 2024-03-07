# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.10)
# Set the project name and version
project(Hazel VERSION 1.0)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set the configuration types
set(CMAKE_CONFIGURATION_TYPES Debug Release)

# Set the output directory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Set the 3rdParty directories
set(GLFW_DIR "${PROJECT_SOURCE_DIR}/Hazel/vendor-ex/GLFW")
set(GLAD_DIR "${PROJECT_SOURCE_DIR}/Hazel/vendor-ex/Glad")
set(IMGUI_DIR "${PROJECT_SOURCE_DIR}/Hazel/vendor-ex/imgui")
set(GLM_DIR "${PROJECT_SOURCE_DIR}/Hazel/vendor-ex/glm")

# Add the subdirectories
add_subdirectory(${GLFW_DIR})
add_subdirectory(${GLAD_DIR})
add_subdirectory(${IMGUI_DIR})

# Set the Hazel Source files.
file(GLOB_RECURSE HAZEL_SRC
     "${PROJECT_SOURCE_DIR}/Hazel/src/*.h"
     "${PROJECT_SOURCE_DIR}/Hazel/src/*.cpp"
     "${GLM_DIR}/glm/*.hpp"
     "${GLM_DIR}/glm/*.inl")

# Add the Hazel library
add_library(Hazel STATIC ${HAZEL_SRC})

# Add the include directories
target_include_directories(Hazel PUBLIC
    "${PROJECT_SOURCE_DIR}/Hazel/src"
    "${PROJECT_SOURCE_DIR}/Hazel/vendor-ex/spdlog/include"
    "${GLFW_DIR}/include"
    "${GLAD_DIR}/include"
    "${IMGUI_DIR}"
    "${GLM_DIR}")

# Add the link libraries
link_directories(${CMAKE_BINARY_DIR}/bin)
target_link_libraries(Hazel PUBLIC glfw glad imgui opengl32)

# Add the platform-specific definitions
if(WIN32)
    target_compile_definitions(Hazel PUBLIC
        HZ_PLATFORM_WINDOWS
        HZ_BUILD_DLL
        GLFW_INCLUDE_NONE
    )
endif()

# Add the configuration-specific definitions
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(Hazel PUBLIC HZ_DEBUG)
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    target_compile_definitions(Hazel PUBLIC HZ_RELEASE)
endif()

# Set the Sanbox Source files.
file(GLOB_RECURSE SANDBOX_SRC
     "${PROJECT_SOURCE_DIR}/Sandbox/src/*.h"
     "${PROJECT_SOURCE_DIR}/Sandbox/src/*.cpp")

# Add the Sandbox Executable
add_executable(Sandbox ${SANDBOX_SRC})

# Add the include directories
target_include_directories(Sandbox PRIVATE
    "${PROJECT_SOURCE_DIR}/Hazel/vendor-ex/spdlog/include"
    "${PROJECT_SOURCE_DIR}/Hazel/src"
    "${PROJECT_SOURCE_DIR}/Hazel/vendor-ex"
    "${GLM_DIR}")

# Add the link libraries
target_link_libraries(Sandbox PRIVATE Hazel)

# Add the configuration-specific definitions
target_compile_definitions(Sandbox PRIVATE HZ_PLATFORM_WINDOWS)
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(Sandbox PRIVATE HZ_DEBUG)
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    target_compile_definitions(Sandbox PRIVATE HZ_RELEASE)
endif()