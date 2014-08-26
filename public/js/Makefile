
build: components index.coffee
	@component build --use component-coffee
	sed -e "s/\.coffee/.js/" build/build.js > build.js

components: component.json
	@component install --dev

clean:
	rm -fr build components template.js

.PHONY: clean
