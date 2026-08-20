find_path(Gluehwein_INCLUDE_DIR sensor.h HINTS ${SIEMENS_3RDPARTY_DIR}/include)
find_library(Gluehwein_Base_LIBRARY NAMES gluehwein-base HINTS ${SIEMENS_3RDPARTY_DIR}/lib)
find_library(Gluehwein_DataLogger_LIBRARY NAMES gluehwein-data-logger HINTS ${SIEMENS_3RDPARTY_DIR}/lib)
find_library(Gluehwein_BoilingPot_LIBRARY NAMES gluehwein-boiling-pot HINTS ${SIEMENS_3RDPARTY_DIR}/lib)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  Gluehwein
  REQUIRED_VARS 
    Gluehwein_INCLUDE_DIR
    Gluehwein_Base_LIBRARY
    Gluehwein_DataLogger_LIBRARY
    Gluehwein_BoilingPot_LIBRARY
)

add_library(Gluehwein::Gluehwein INTERFACE IMPORTED)
target_link_libraries(Gluehwein::Gluehwein INTERFACE ${Gluehwein_BoilingPot_LIBRARY} ${Gluehwein_DataLogger_LIBRARY} ${Gluehwein_Base_LIBRARY})
target_include_directories(Gluehwein::Gluehwein INTERFACE ${Gluehwein_INCLUDE_DIR})
