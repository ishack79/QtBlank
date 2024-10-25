cmake_minimum_required(VERSION 3.16)
project(main)

# Find the Qt5 package
find_package(Qt5 COMPONENTS Widgets Qml Quick REQUIRED)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")

set(SOURCES
    main.cpp
    resources.qrc
)

qt5_add_resources(RESOURCES resources.qrc)

add_executable(main ${SOURCES} ${RESOURCES})

target_link_libraries(main Qt5::Widgets Qt5::Qml Qt5::Quick)