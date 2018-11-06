INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_ICSL icsl)

FIND_PATH(
    ICSL_INCLUDE_DIRS
    NAMES icsl/api.h
    HINTS $ENV{ICSL_DIR}/include
        ${PC_ICSL_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    ICSL_LIBRARIES
    NAMES gnuradio-icsl
    HINTS $ENV{ICSL_DIR}/lib
        ${PC_ICSL_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(ICSL DEFAULT_MSG ICSL_LIBRARIES ICSL_INCLUDE_DIRS)
MARK_AS_ADVANCED(ICSL_LIBRARIES ICSL_INCLUDE_DIRS)

