DOC_PATH = docs
TEMPLATE_PATH = templates

# Find all documentation files
DOC_FILES = $(shell find docs/src/ -type f)

# Define template and generated file names
DOCS_TEMPLATE = $(TEMPLATE_PATH)/docs_template.md
GEN_DOC_FILES = $(DOC_PATH)/README.md $(DOC_PATH)/docs.yaml

SITE_TEMPLATE = $(TEMPLATE_PATH)/site_template.htm
GEN_SITE_FILE = index.htm

.PHONY: docs site

# Generate documentation files
$(GEN_DOC_FILES): $(DOCS_TEMPLATE) $(DOC_FILES)
	@echo "Making docs: $@"

# Generate site
$(GEN_SITE_FILE): $(SITE_TEMPLATE) $(GEN_DOC_FILES)
	@echo "Making site: $@"

docs: $(GEN_DOC_FILES)
site: $(GEN_SITE_FILE)
