# Включаем FetchContent для загрузки зависимостей
include(FetchContent)

# Загружаем Google Test
FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/refs/tags/v1.15.2.zip
)

# Делаем Google Test доступным
FetchContent_MakeAvailable(googletest)

# Включаем тестирование
enable_testing()
add_executable(add_test add_test.cpp)
target_link_libraries(add_test PRIVATE add)

# Линкуем GTest и нашу библиотеку add
target_link_libraries(add_test PRIVATE GTest::gtest GTest::gtest_main add)

# Добавляем тест в CTest
add_test(NAME AddTest COMMAND add_test)

# Настраиваем цель для генерации отчета покрытия кода
setup_target_for_coverage(coverage add_test)