cmake_minimum_required(VERSION 3.14)

project(TOMATODO VERSION 0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Quick)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS LinguistTools Core Quick Sql)

#file(GLOB TS_FILES "${PROJECT_SOURCE_DIR}/translation/*.ts")
SET(TS_FILES
        ${PROJECT_SOURCE_DIR}/translations/english.ts
        ${PROJECT_SOURCE_DIR}/translations/vietnamese.ts
)

qt5_create_translation(QM_FILES
    ${PROJECT_SOURCE_DIR}
    ${TS_FILES})

set(PROJECT_SOURCES
        taskcarditemlist.h
        taskcarditemlist.cpp

        tomatodotaskitem.h
        tomatodotaskitem.cpp

        main.cpp
        qml.qrc
        assets.qrc
)

if (${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    enable_language("RC")
    set (WIN32_RESOURCES ${CMAKE_CURRENT_SOURCE_DIR}/tomatodoApp.rc)
endif()

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(TOMATODO
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )
# Define target properties for Android with Qt 6 as:
#    set_property(TARGET TOMATODO APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR
#                 ${CMAKE_CURRENT_SOURCE_DIR}/android)
# For more information, see https://doc.qt.io/qt-6/qt-add-executable.html#target-creation
else()
    if(ANDROID)
        add_library(TOMATODO SHARED
            ${PROJECT_SOURCES}
            ${QM_FILES}
        )
# Define properties for Android with Qt 5 after find_package() calls as:
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
    else()
        add_executable(TOMATODO
          ${PROJECT_SOURCES}
          ${WIN32_RESOURCES}
          ${QM_FILES}
        )
    endif()
endif()
#qrc:/assets/icon/tomato.ico//
target_link_libraries(TOMATODO
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick Qt5::Sql)

file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/db/tomatodoDB.db
     DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

set_target_properties(TOMATODO PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS TOMATODO
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

if(QT_VERSION_MAJOR EQUAL 6)
    qt_import_qml_plugins(TOMATODO)
    qt_finalize_executable(TOMATODO)

endif()
