# Мобильное приложение контролёра и партнёра ЕКЖ Мурманской области

## Сборка приложения

Перед началось запуска/сборки проекта запустите команду:
```
dart run build_runner build --delete-conflicting-outputs
```


Для создание APK-файла запустите следующую команду:
```
flutter build apk 
```
Эта команда создаст один APK-файл для всех ABI, что делает его большим по объёму.

Чтобы создать отдельные APK-файлы, запустите команду:
```
flutter build apk --split-per-abi
```
Эта команда создаст 3 файла:
* app-armeabi-v7a-release.apk
* app-arm64-v8a-release.apk
* app-x86_64-release.apk