cmake_minimum_required(VERSION 3.22)
project(main)

# Find the Qt5 package
find_package(Qt5 COMPONENTS Widgets Qml Quick REQUIRED)

set(SOURCES
    main.cpp
    resources.qrc
)

qt5_add_resources(RESOURCES resources.qrc)

add_executable(main ${SOURCES} ${RESOURCES})

target_link_libraries(main Qt5::Widgets Qt5::Qml Qt5::Quick)