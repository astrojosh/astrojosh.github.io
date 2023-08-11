# Create html from template.htm and docs.yaml
index.htm:
	@make -C docs/ README.md docs.yaml --no-print-directory
	@echo "Making site!"
	@echo "Made site!"

.PHONY: docs site
docs:
	@make -C docs/ README.md docs.yaml --no-print-directory
site: index.htm
