# Создаём статическую библиотеку add
add_library(add STATIC add.cpp)

# Указываем директорию с заголовочными файлами
target_include_directories(add PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
