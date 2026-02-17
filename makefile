build_upload:
	flutter clean
	flutter pub get
	flutter build web --release --no-tree-shake-icons
	firebase deploy --only hosting

