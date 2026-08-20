cmake_minimum_required(VERSION 3.16)
project(Gluehwein)

find_package(SQLite3 REQUIRED)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
include(functions)

add_subdirectory(firmware)
add_subdirectory(toolcase/boiling-pot)
add_subdirectory(toolcase/data-logger)
add_subdirectory(toolcase/base)
add_subdirectory(toolcase/errors)

install(FILES cmake/FindGluehwein.cmake DESTINATION share/Modules)
