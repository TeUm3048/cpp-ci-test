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
add_subdirectory(add)
add_subdirectory(mul)

# Настраиваем цель для генерации отчета покрытия кода
setup_target_for_coverage(coverage all)