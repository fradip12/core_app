# Default environment is dev if not specified
ENV ?= dev

.PHONY: run build run-dev run-prod build-dev build-prod help

# Run the application with specified environment
run:
	@echo "Running the projec..." ; \
	fvm flutter run; \

l10n:
	@echo "Generating the project..." ; \
	fvm flutter gen-l10n ; \ 

generate:
	@echo "Generating the project..." ; \
	fvm flutter pub run build_runner build --delete-conflicting-outputs ; \

build:
	@echo "Building the project ..." ; \
	@echo "Building App Bundle..." ; \
	fvm flutter build appbundle ; \
	@echo "Building IPA..." ; \
	fvm flutter build ipa ; \
	@echo "All builds completed ." ; \
