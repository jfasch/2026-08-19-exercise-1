gluehwein_add_library(
  NAME gluehwein-data-logger
  VERBOSE
  PUBLIC_HEADERS 

    data-logger.h
    sensor-config.h
    sensor-values.h
    sink-file.h
    sink-logger.h
    sink-mock.h
    sink-terminal.h
    sink-sqlite3.h

  SOURCES

    data-logger.cpp
    sink-sqlite3.cpp
  
  DEPENDENCIES

    gluehwein-base
    SQLite::SQLite3
  
  )
