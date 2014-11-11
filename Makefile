.PHONY: serve setup

setup:
	npm install
	bower install
	grunt

serve:
	python -m SimpleHTTPServer
