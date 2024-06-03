build_upload:
	flutter clean
	rm -rf build
	flutter build web
	firebase deploy --only hosting

