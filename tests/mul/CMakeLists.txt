add_executable(mul_test mul_test.cpp)
target_link_libraries(mul_test PRIVATE mul)

# Добавляем тест в CTest
add_test(NAME MulTest COMMAND mul_test)

include(GoogleTest)
target_link_libraries(mul_test PRIVATE GTest::gtest_main)
gtest_discover_tests(mul_test)
