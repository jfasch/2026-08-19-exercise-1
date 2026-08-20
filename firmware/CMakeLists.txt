add_executable(boiling-pot boiling-pot.cpp)
target_link_libraries(
  boiling-pot

  gluehwein-boiling-pot
  gluehwein-base
)

add_executable(data-logger data-logger.cpp)
target_link_libraries(
  data-logger

  gluehwein-data-logger
  gluehwein-base
)
