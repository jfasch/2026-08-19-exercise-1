function(gluehwein_add_library)

  cmake_parse_arguments(gluehwein_param
    "VERBOSE"         # options/flags
    "NAME;TYPE"
    "PUBLIC_HEADERS;PRIVATE_HEADERS;SOURCES;DEPENDENCIES"

    ${ARGN}
  )

  if (gluehwein_param_VERBOSE)
    message("wir haben jetzt empfangen:\n"
      "  VERBOSE: ${gluehwein_param_VERBOSE}\n"
      "  NAME: ${gluehwein_param_NAME}\n"
      "  PUBLIC_HEADERS: ${gluehwein_param_PUBLIC_HEADERS}\n"
      "  PRIVATE_HEADERS: ${gluehwein_param_PRIVATE_HEADERS}\n"
      "  SOURCES: ${gluehwein_param_SOURCES}\n"
      "  DEPENDENCIES: ${gluehwein_param_DEPENDENCIES}\n"
    )
  endif()

  list(TRANSFORM gluehwein_param_SOURCES PREPEND "src/")
  list(TRANSFORM gluehwein_param_PUBLIC_HEADERS PREPEND "include/public/")
  list(TRANSFORM gluehwein_param_PRIVATE_HEADERS PREPEND "include/private/")

  if (NOT DEFINED gluehwein_param_TYPE)
    add_library(
      ${gluehwein_param_NAME}

      ${gluehwein_param_PUBLIC_HEADERS}
      ${gluehwein_param_PRIVATE_HEADERS}
      ${gluehwein_param_SOURCES}
    )
  elseif ("${gluehwein_param_TYPE}" STREQUAL "static")
    add_library(
      ${gluehwein_param_NAME}

      STATIC

      ${gluehwein_param_PUBLIC_HEADERS}
      ${gluehwein_param_PRIVATE_HEADERS}
      ${gluehwein_param_SOURCES}
    )
  elseif("${gluehwein_param_TYPE}" STREQUAL "shared")
    add_library(
      ${gluehwein_param_NAME}

      SHARED

      ${gluehwein_param_PUBLIC_HEADERS}
      ${gluehwein_param_PRIVATE_HEADERS}
      ${gluehwein_param_SOURCES}
    )
  else()
    message(FATAL_ERROR "gluehwein_add_library(): must specify TYPE={static|shared}")
  endif()

  target_link_libraries(
    ${gluehwein_param_NAME}

    ${gluehwein_param_DEPENDENCIES}
  )

  # eigene src/*.cpp
  target_include_directories(
    ${gluehwein_param_NAME}

    PRIVATE

    ${CMAKE_CURRENT_SOURCE_DIR}/include/public
    ${CMAKE_CURRENT_SOURCE_DIR}/include/private
  )

  # fuer dependers
  target_include_directories(
    ${gluehwein_param_NAME}

    INTERFACE

    ${CMAKE_CURRENT_SOURCE_DIR}/include/public
  )  

  install(TARGETS ${gluehwein_param_NAME} DESTINATION lib)
  install(FILES

    ${gluehwein_param_PUBLIC_HEADERS}
    
    DESTINATION include
  )

endfunction()
