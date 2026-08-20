add_library(
  gluehwein-errors

  INTERFACE
)

target_include_directories(
  gluehwein-errors

  INTERFACE

  ${CMAKE_CURRENT_SOURCE_DIR}
)

install(FILES error.h DESTINATION include)
