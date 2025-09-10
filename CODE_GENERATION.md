# Code Generation

Bu proje JSON serialization için code generation kullanır.

## Gerekli komutlar:

```bash
# Tek seferlik generation
flutter packages pub run build_runner build

# Watch mode (development sırasında)
flutter packages pub run build_runner watch

# Conflicted files'ları silip yeniden generate et
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Generated files:

- `lib/models/product.g.dart`
- `lib/models/cart_item.g.dart`

Bu dosyalar otomatik olarak oluşturulacaktır ve Git'e commit edilmemelidir (.gitignore'da tanımlıdır).