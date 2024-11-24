# Указываем имя библиотеки
add_library(add)

# Добавляем исходные файлы в библиотеку
target_sources(add PRIVATE add/add.cpp)

# Указываем заголовочные файлы для удобства IDE (необязательно)
target_include_directories(add PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/add)

# Создаем исполняемый файл main
add_executable(main main.cpp)

# Линкуем библиотеку add с исполняемым файлом
target_link_libraries(main PRIVATE add)
