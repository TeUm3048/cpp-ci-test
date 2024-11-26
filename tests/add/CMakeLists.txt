add_executable(add_test add_test.cpp)
target_link_libraries(add_test PRIVATE add)

# Добавляем тест в CTest
add_test(NAME AddTest COMMAND add_test)

include(GoogleTest)
target_link_libraries(add_test PRIVATE GTest::gtest_main)
gtest_discover_tests(add_test)
