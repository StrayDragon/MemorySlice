cmake_minimum_required(VERSION 3.0.0)
project(studyTDD VERSION 0.1.0)

# [可选] !
enable_testing()

# [依赖] googletest
add_subdirectory(dep/googletest)
include_directories(deps/googletest/googletest/include) # gtest
include_directories(deps/googletest/googlemock/include) # gmock
set(GTEST_MAIN dep/googletest/googletest/src/gtest_main.cc)

add_executable(study_tdd test/test.cpp)

# [链接库]
target_link_libraries(study_tdd gtest gtest_main)
target_link_libraries(study_tdd gmock gmock_main)
