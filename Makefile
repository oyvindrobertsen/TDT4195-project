.PHONY: serve devsetup

devsetup:
	bower install

serve:
	python -m SimpleHTTPServer
