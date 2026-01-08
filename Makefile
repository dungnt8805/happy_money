.PHONY: all run_dev_web run_dev_mobile run_unit clean upgrade lint format sync_stg_version sync_prod_version build_dev_mobile help watch gen run_stg_mobile run_prod_mobile build_apk_dev build_apk_stg build_apk_prod purge

all: lint format run_dev_mobile

# Adding a help file: https://gist.github.com/prwhite/8168133#gistcomment-1313022
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

run_unit: ## Runs unit tests
	@echo "╠ Running the tests"
	@fvm flutter test || (echo "Error while running tests"; exit 1)

clean: ## Cleans the environment
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@fvm flutter clean
	@fvm flutter pub get

build_runner: ## Generates the code
	@echo "╠ Generates the code..."
	@fvm flutter pub get
	@fvm dart run build_runner build

build_runner_d: ## Generates the code with flag --delete-conflicting-outputs
	@echo "╠ Generates the code with flag --delete-conflicting-outputs..."
	@fvm flutter pub get
	@fvm dart run build_runner build --delete-conflicting-outputs

build_runner_res: ## Generates the resources: assets, i10l, font, ...
	cd packages/resources && make build_runner

build_runner_res_d: ## Generates the resources (assets, i10l, font, ...) with flag --delete-conflicting-outputs
	cd packages/resources && make build_runner_d

build_runner_watch: ## Watches the files for changes
	@echo "╠ Generating the assets and watching in the project..."
	@fvm dart run build_runner watch --delete-conflicting-outputs

format: ## Formats the code
	@echo "╠ Formatting the code"
	@dart format lib .
	@fvm dart run import_sorter:main
	@fvm flutter format lib

lint: ## Lints the code
	@echo "╠ Verifying code..."
	@dart analyze . || (echo "Error in project"; exit 1)

sync_stg_version: ## Sync stg version
	sh ./pubspec_version.sh stg

sync_prod_version: ## Sync prod version
	sh ./pubspec_version.sh prod

run_dev: ## Runs the mobile application in dev
	@echo "╠ Running the app"
	@fvm flutter run --flavor dev --dart-define-from-file=.env/dev.json

run_stg: ## Runs the mobile application in stg
	@echo "╠ Running the app"
	@fvm flutter run --flavor stg --dart-define-from-file=.env/stg.json

run_prod: ## Runs the mobile application in prod
	@echo "╠ Running the app"
	@fvm flutter run --flavor prod --dart-define-from-file=.env/prod.json

build_apk_dev: ## Build the apk in dev
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter build apk --flavor dev --dart-define-from-file=.env/dev.json

build_apk_stg: sync_stg_version ## Build the apk in staging
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter build apk --flavor stg --dart-define-from-file=.env/stg.json

build_apk_prod: sync_prod_version ## Build the apk in prod
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter build apk --flavor prod --dart-define-from-file=.env/prod.json

build_appbundle_dev: ## Build the appbundle in dev
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter build appbundle --flavor dev --dart-define-from-file=.env/dev.json

build_appbundle_stg: sync_stg_version ## Build the appbundle in staging
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter build appbundle --flavor stg --dart-define-from-file=.env/stg.json

build_appbundle_prod: sync_prod_version ## Build the appbundle in prod
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter build appbundle --flavor prod --dart-define-from-file=.env/prod.json

build_ipa_dev: ## Build the ipa in dev
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter build ipa --flavor dev --dart-define-from-file=.env/dev.json

build_ipa_stg: sync_stg_version ## Build the ipa in staging
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter build ipa --flavor stg --dart-define-from-file=.env/stg.json

build_ipa_prod: sync_prod_version ## Build the ipa in prod
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter build ipa --flavor prod --dart-define-from-file=.env/prod.json