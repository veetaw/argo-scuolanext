echo todo
cd ..

flutter pub pub run intl_translation:generate_from_arb --output-dir=lib\src\l10n --no-use-deferred-loading lib\src\l10n\intl_en.arb lib\src\l10n\intl_it.arb lib\src\l10n\intl_messages.arb lib\src\locale\locales.dart