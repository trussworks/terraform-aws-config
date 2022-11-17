.PHONY: ensure_pre_commit
ensure_pre_commit:
	[ -f .git/hooks/pre-commit ] && echo "Hook ready" || pre-commit install || echo "Please install pre-commit (https://pre-commit.com/)"

.PHONY: pre_commit_tests
pre_commit_tests: ensure_pre_commit ## Run pre-commit tests
	pre-commit run --all-files


.PHONY: clean
clean:
	rm -f .*.stamp
