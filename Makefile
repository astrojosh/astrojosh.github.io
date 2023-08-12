DOCS_PATH = docs
TEMPLATES_PATH = templates
SCRIPTS_PATH = scripts

# Find all documentation files
DOCS_FILES = $(shell find docs/src/ -type f -name "*.md")

# Define docs template and generated file names
DOCS_TEMPLATE = $(TEMPLATES_PATH)/docs_template.md
GEN_DOCS_MARKDOWN = $(DOCS_PATH)/README.md

GEN_DOCS_YAML = $(DOCS_PATH)/docs.yaml

# Define site template and generated file name
SITE_TEMPLATE = $(TEMPLATES_PATH)/site_template.htm
GEN_SITE_FILE = index.htm

# Define script paths
GEN_DOCS_SCRIPT = $(SCRIPTS_PATH)/generate_docs.py
GEN_SITE_SCRIPT = $(SCRIPTS_PATH)/generate_site.py

VENV = .venv/bin/activate

.PHONY: docs site

# Generate documentation files
$(GEN_DOCS_MARKDOWN): $(DOCS_TEMPLATE) $(DOCS_FILES)
	@echo "Making docs markdown: $@"
	@. $(VENV); python $(GEN_DOCS_SCRIPT) $@ $(DOCS_TEMPLATE)

$(GEN_DOCS_YAML): $(GEN_DOCS_MARKDOWN)
	@echo "Making docs yaml: $@"
	@. $(VENV); python $(GEN_DOCS_SCRIPT) $@ $(GEN_DOCS_MARKDOWN)

# Generate site
$(GEN_SITE_FILE): $(SITE_TEMPLATE) $(GEN_DOCS_YAML)
	@echo "Making site: $@"
	@. $(VENV); python $(GEN_SITE_SCRIPT) $(SITE_TEMPLATE) $(GEN_DOCS_YAML)

docs: $(GEN_DOCS_YAML)
site: $(GEN_SITE_FILE)
