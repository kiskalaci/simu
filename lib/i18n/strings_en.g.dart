///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get title => 'SimuBank';
	String get simuBank => 'Simu Bank';
	String get digitalBanking => 'Digital Banking';
	String get errorHasOccurred => 'An error has occurred';
	String get hello => 'Hello';
	String get search => 'Search';
	String get cancel => 'Cancel';
	String get settings => 'Settings';
	String get ok => 'Ok';
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
	late final TranslationsTransactionsEn transactions = TranslationsTransactionsEn._(_root);
	late final TranslationsOperationEn operation = TranslationsOperationEn._(_root);
	late final TranslationsValidationEn validation = TranslationsValidationEn._(_root);
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get login => 'Login';
	String get logout => 'Logout';
	String get email => 'Email';
	String get password => 'Password';
	String get registration => 'Registration';
	String get noAccountYet => 'No account yet? Create now!';
}

// Path: transactions
class TranslationsTransactionsEn {
	TranslationsTransactionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Transactions';
	String get transactionDetails => 'Transaction details';
	String get noTransactions => 'No transactions';
	String get date => 'Date';
	String get merchant => 'Merchant';
	String get category => 'Category';
	String get toAccount => 'To Account';
}

// Path: operation
class TranslationsOperationEn {
	TranslationsOperationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get successfulOperation => 'Successful operation!';
	String get errorHappened => 'Error happened!';
}

// Path: validation
class TranslationsValidationEn {
	TranslationsValidationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get invalidEmail => 'Invalid email address';
	String get fieldRequired => 'Field required';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'title': return 'SimuBank';
			case 'simuBank': return 'Simu Bank';
			case 'digitalBanking': return 'Digital Banking';
			case 'errorHasOccurred': return 'An error has occurred';
			case 'hello': return 'Hello';
			case 'search': return 'Search';
			case 'cancel': return 'Cancel';
			case 'settings': return 'Settings';
			case 'ok': return 'Ok';
			case 'auth.login': return 'Login';
			case 'auth.logout': return 'Logout';
			case 'auth.email': return 'Email';
			case 'auth.password': return 'Password';
			case 'auth.registration': return 'Registration';
			case 'auth.noAccountYet': return 'No account yet? Create now!';
			case 'transactions.title': return 'Transactions';
			case 'transactions.transactionDetails': return 'Transaction details';
			case 'transactions.noTransactions': return 'No transactions';
			case 'transactions.date': return 'Date';
			case 'transactions.merchant': return 'Merchant';
			case 'transactions.category': return 'Category';
			case 'transactions.toAccount': return 'To Account';
			case 'operation.successfulOperation': return 'Successful operation!';
			case 'operation.errorHappened': return 'Error happened!';
			case 'validation.invalidEmail': return 'Invalid email address';
			case 'validation.fieldRequired': return 'Field required';
			default: return null;
		}
	}
}

